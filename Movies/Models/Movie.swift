import Foundation

struct Movie {
  let title: String
  let releaseDate: NSDate

  init(title: String, releaseDate: NSDate) {
    self.title = title
    self.releaseDate = releaseDate
  }
}

extension Movie: Equatable {}

func ==(lhs: Movie, rhs: Movie) -> Bool {
  return lhs.title == rhs.title
}
