import Foundation

struct Movie {
  let title: String
  let releaseDate: NSDate
  let thumbnailURL: NSURL

  init(title: String, releaseDate: NSDate, thumbnailURL: NSURL) {
    self.title = title
    self.releaseDate = releaseDate
    self.thumbnailURL = thumbnailURL
  }
}

extension Movie: Equatable {}

func ==(lhs: Movie, rhs: Movie) -> Bool {
  return lhs.title == rhs.title
}
