import UIKit

class ImageService {
  static let sharedInstance = ImageService()

  let urlSession: URLSession = NSURLSession.sharedSession()
  var imageCache: [NSURL: UIImage] = [:]

  func fetchImage(url: NSURL, closure: (image: UIImage) -> Void) {
    if let image = imageCache[url] {
      print("returning image from cache")
      closure(image: image)
    } else {
      print("fetching image from network")
      let dataTask = urlSession.dataTaskWithURL(url) {
        data, response, error in
        if let data = data, image = UIImage(data: data) {
          self.imageCache[url] = image
          closure(image: image)
        }
      }
      dataTask.resume()
    }
  }
}