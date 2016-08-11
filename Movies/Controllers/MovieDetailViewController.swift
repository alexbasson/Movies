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

    if let titleLabel = titleLabel, movie = movie {
      titleLabel.text = movie.title
    }
    if let releaseDateLabel = releaseDateLabel, movie = movie {
      releaseDateLabel.text = dateFormatter.stringFromDate(movie.releaseDate)
    }
  }
}
