import Quick
import Nimble
@testable import Movies

class FakeMovieService: MovieService {
  func fetchMovies(closure: ([Movie] -> Void)) {
    closure([
      Movie(title: "Movie 1"),
      Movie(title: "Movie 2")
    ])
  }
}

class MoviesViewControllerSpec: QuickSpec {
  override func spec() {
    describe("MoviesViewController") {
      var moviesViewController: MoviesViewController!

      beforeEach() {
        // get the storyboard and use it to create an instance of MoviesViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        moviesViewController = storyboard.instantiateViewControllerWithIdentifier("MoviesViewController") as! MoviesViewController
        moviesViewController.movieService = FakeMovieService()

        // render moviesViewController's view, so that we can test it
        let window = UIApplication.sharedApplication().keyWindow!
        window.rootViewController = moviesViewController
        NSRunLoop.mainRunLoop().runUntilDate(NSDate())
      }

      it("has a table view") {
        expect(moviesViewController.tableView).notTo(beNil())
      }

      it("has some movie titles in the table view") {
        let cells: [MovieCell] = moviesViewController.tableView!.visibleCells as! [MovieCell]
        let firstCell = cells[0]
        expect(firstCell.titleLabel!.text!).to(equal("Movie 1"))

        let secondCell = cells[1]
        expect(secondCell.titleLabel!.text!).to(equal("Movie 2"))
      }

      it("has the same number of cells as movies") {
        let numberOfCells = moviesViewController.tableView!.numberOfRowsInSection(0)
        let numberOfMovies = 2
        expect(numberOfCells).to(equal(numberOfMovies))
      }
    }
  }
}
