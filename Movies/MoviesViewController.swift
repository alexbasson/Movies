import UIKit

class MoviesViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView?
}

extension MoviesViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath)
  }
}
