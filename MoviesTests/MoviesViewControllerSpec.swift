import Quick
import Nimble
@testable import Movies

class MoviesViewControllerSpec: QuickSpec {
  override func spec() {
    describe("MoviesViewController") {
      var moviesViewController: MoviesViewController!

      beforeEach() {
        // get the storyboard and use it to create an instance of MoviesViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        moviesViewController = storyboard.instantiateViewControllerWithIdentifier("MoviesViewController") as! MoviesViewController

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
      }
    }
  }
}
