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
      if let data = data {
        do {
          let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
          typealias MovieJson = [String: AnyObject] // the json representation of a movie
          // json["movies"] points to an array where the elements of
          // the array are json representations of movies
          var movies: [Movie] = []
          if let moviesJson = json["movies"] as? [MovieJson] {
            for movieJson in moviesJson {
              if let title = movieJson["title"] as? String {
                let movie = Movie(title: title)
                movies.append(movie)
              }
            }
          }
          closure(movies)
        } catch {}
      }
    }
    dataTask.resume()
  }
}
