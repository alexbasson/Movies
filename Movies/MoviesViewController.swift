import UIKit

class MoviesViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView?

  let movies = ["Movie 1", "Movie 2"]
}

extension MoviesViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
    if let titleLabel = cell.titleLabel {
      titleLabel.text = movies[indexPath.row]
    }
    return cell
  }
}
