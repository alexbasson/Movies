import Quick
import Nimble
@testable import Movies

class FakeURLSessionDataTask: URLSessionDataTask {
  var resumeWasCalled: Bool = false

  func resume() {
    resumeWasCalled = true
  }
}

class FakeURLSession: URLSession {
  var requestedURL: NSURL!
  var dataTask = FakeURLSessionDataTask()

  func dataTaskWithURL(url: NSURL, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> URLSessionDataTask {
    requestedURL = url
    return dataTask
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
          beforeEach() {
            // call 'fetchMovies' on the movie service,
            // so that we can test its behavior
            movieService.fetchMovies() {
              movies in
            }
          }

          it("makes a request to fetch movies") {
            // expect that movie service passed the correct url to the url session
            let moviesURL = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=f5u89dy6zq9ccyh5a728dzcu")!
            expect(urlSession.requestedURL).to(equal(moviesURL))
          }

          it("tells the data task to start") {
            expect(urlSession.dataTask.resumeWasCalled).to(beTrue())
          }
        }

        describe("handling the network response") {

        }
      }
    }
  }
}
