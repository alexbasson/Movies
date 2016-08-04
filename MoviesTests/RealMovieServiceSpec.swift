import Quick
import Nimble
@testable import Movies

class FakeURLSession: URLSession {
  var requestedURL: NSURL!

  func dataTaskWithURL(url: NSURL, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {
    requestedURL = url
    return NSURLSessionDataTask()
  }
}

class RealMovieServiceSpec: QuickSpec {
  override func spec() {
    describe("RealMovieService") {
      var movieService: RealMovieService!
      var urlSession: FakeURLSession!

      beforeEach() {
        // create a fake url session
        urlSession = FakeURLSession()

        // create an instance of movie service for testing,
        // and pass in our fake url session
        movieService = RealMovieService(urlSession: urlSession)
      }

      describe("fetching movies") {
        describe("making the network request") {
          it("makes a request to fetch movies") {
            // call 'fetchMovies' on the movie service,
            // so that we can test its behavior
            movieService.fetchMovies() {
              movies in
            }

            // expect that movie service passed the correct url to the url session
            let moviesURL = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=f5u89dy6zq9ccyh5a728dzcu")!
            expect(urlSession.requestedURL).to(equal(moviesURL))
          }
        }

        describe("handling the network response") {

        }
      }
    }
  }
}
