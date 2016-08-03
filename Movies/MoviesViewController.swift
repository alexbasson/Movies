import UIKit

class MoviesViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView?
  var movieService: MovieService = RealMovieService()
  var movies: [Movie] = []

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    movies = movieService.movies()
  }
}

extension MoviesViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
    if let titleLabel = cell.titleLabel {
      titleLabel.text = movies[indexPath.row].title
    }
    return cell
  }
}
