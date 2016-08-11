import Foundation

class RealMovieService: MovieService {
  let urlSession: URLSession
  var dateFormatter = NSDateFormatter()

  convenience init() {
    self.init(urlSession: NSURLSession.sharedSession())
  }

  init(urlSession: URLSession) {
    self.urlSession = urlSession
    dateFormatter.dateFormat = "yyyy-MM-dd"
  }

  func fetchMovies(closure: ([Movie] -> Void)) {
    let moviesURL = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=f5u89dy6zq9ccyh5a728dzcu")!
    let dataTask = urlSession.dataTaskWithURL(moviesURL) { (data, response, error) in
      if let data = data {
        do {
          let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
          typealias MovieJson = [String: AnyObject]
          if let movies = json["movies"] as? [MovieJson] {
            closure(movies.map({
              let title = $0["title"] as! String
              let releaseDates = $0["release_dates"] as! [String: String]
              let releaseDateString = releaseDates["theater"]!
              let releaseDate = self.dateFormatter.dateFromString(releaseDateString)!
              return Movie(title: title, releaseDate: releaseDate)
            }))
          }
        } catch {}
      }
    }
    dataTask.resume()
  }
}
