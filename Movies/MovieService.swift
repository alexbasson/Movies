struct Movie {
  let title: String

  init(title: String) {
    self.title = title
  }
}

class MovieService {
  let movies = [
    Movie(title: "Movie 1"),
    Movie(title: "Movie 2"),
    Movie(title: "Movie 3")
  ]
}
