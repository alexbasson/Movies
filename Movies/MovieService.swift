struct Movie {
  let title: String

  init(title: String) {
    self.title = title
  }
}

protocol MovieService {
  func movies() -> [Movie]
}

class RealMovieService: MovieService {
  func movies() -> [Movie] {
    return [
      Movie(title: "Movie 1"),
      Movie(title: "Movie 2"),
      Movie(title: "Movie 3")
    ]
  }
}
