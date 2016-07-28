import UIKit

class MoviesViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView?
  var movieService: MovieService = RealMovieService()
}

extension MoviesViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movieService.movies().count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
    if let titleLabel = cell.titleLabel {
      titleLabel.text = movieService.movies()[indexPath.row].title
    }
    return cell
  }
}
