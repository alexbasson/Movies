import UIKit

class MoviesViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView?
  var movieService: MovieService = RealMovieService()
  var movies: [Movie] = []
  var dateFormatter = NSDateFormatter()

  override func viewDidLoad() {
    super.viewDidLoad()
    dateFormatter.dateStyle = .LongStyle
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    movieService.fetchMovies() {
      movies in
      self.movies = movies
      if let tableView = self.tableView {
        dispatch_async(dispatch_get_main_queue()) {
          tableView.reloadData()
        }
      }
    }
  }
}

extension MoviesViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
    let movie = movies[indexPath.row]
    if let titleLabel = cell.titleLabel {
      titleLabel.text = movie.title
    }
    if let releaseDateLabel = cell.releaseDateLabel {
      releaseDateLabel.text = dateFormatter.stringFromDate(movie.releaseDate)
    }
    return cell
  }
}

extension MoviesViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let selectedMovie = movies[indexPath.row]

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    if let movieDetailViewController = storyboard.instantiateViewControllerWithIdentifier("MovieDetailViewController") as? MovieDetailViewController {
      movieDetailViewController.movie = selectedMovie

      if let navController = self.navigationController {
        navController.pushViewController(movieDetailViewController, animated: true)
      }
    }
  }
}
