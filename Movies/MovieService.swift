struct Movie {
  let title: String

  init(title: String) {
    self.title = title
  }
}

protocol MovieService {
  func fetchMovies(closure: ([Movie] -> Void)) -> Void
}

class RealMovieService: MovieService {
  func fetchMovies(closure: ([Movie] -> Void)) {
    closure([
      Movie(title: "Movie 1"),
      Movie(title: "Movie 2"),
      Movie(title: "Movie 3")
    ])
  }
}
