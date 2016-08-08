import Foundation

protocol URLSessionDataTask {
  func resume()
}

extension NSURLSessionDataTask: URLSessionDataTask {}

protocol URLSession {
  func dataTaskWithURL(url: NSURL, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> URLSessionDataTask
}

extension NSURLSession: URLSession {
  func dataTaskWithURL(url: NSURL, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> URLSessionDataTask {
    return (dataTaskWithURL(url, completionHandler: completionHandler) as NSURLSessionDataTask) as URLSessionDataTask
  }
}