import UIKit

class BaseViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.grayColor()
  }
}

class MovieDetailViewController: BaseViewController {
  @IBOutlet weak var posterImageView: UIImageView?
  @IBOutlet weak var titleLabel: UILabel?
  @IBOutlet weak var releaseDateLabel: UILabel?

  var imageService = ImageService.sharedInstance
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
    guard let posterImageView = posterImageView else { return }

    titleLabel.text = movie.title
    releaseDateLabel.text = dateFormatter.stringFromDate(movie.releaseDate)
    imageService.fetchImage(movie.thumbnailURL) {
      image in
      posterImageView.image = image
    }
  }
}
