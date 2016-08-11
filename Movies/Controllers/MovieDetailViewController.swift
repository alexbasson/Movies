import UIKit

class MovieDetailViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel?
  @IBOutlet weak var releaseDateLabel: UILabel?

  var dateFormatter = NSDateFormatter()

  var movie: Movie?

  override func viewDidLoad() {
    super.viewDidLoad()
    dateFormatter.dateStyle = .FullStyle
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    guard let movie = movie else { return }
    guard let titleLabel = titleLabel else { return }
    guard let releaseDateLabel = releaseDateLabel else { return }

    titleLabel.text = movie.title
    releaseDateLabel.text = dateFormatter.stringFromDate(movie.releaseDate)
  }
}
