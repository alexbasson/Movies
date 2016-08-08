protocol MovieService {
  func fetchMovies(closure: ([Movie] -> Void)) -> Void
}
