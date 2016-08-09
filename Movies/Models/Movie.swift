struct Movie {
  let title: String

  init(title: String) {
    self.title = title
  }
}

extension Movie: Equatable {}

func ==(lhs: Movie, rhs: Movie) -> Bool {
  return lhs.title == rhs.title
}
