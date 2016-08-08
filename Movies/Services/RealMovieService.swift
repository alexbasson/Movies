import Foundation

class RealMovieService: MovieService {
  let urlSession: URLSession

  convenience init() {
    self.init(urlSession: NSURLSession.sharedSession())
  }

  init(urlSession: URLSession) {
    self.urlSession = urlSession
  }

  func fetchMovies(closure: ([Movie] -> Void)) {
    let moviesURL = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=f5u89dy6zq9ccyh5a728dzcu")!
    let dataTask = urlSession.dataTaskWithURL(moviesURL) { (data, response, error) in
    }
    dataTask.resume()
  }
}
