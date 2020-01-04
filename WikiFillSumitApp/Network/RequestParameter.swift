//
//  RequestParameter.swift
import Alamofire

open class RequestParameter {
  /// Url to hit the api
  var url: String
  
  /// Method type e.g. GET/POST etc.
  var method: Alamofire.HTTPMethod
  
  /// Headers needed for the api call
  var headers: [String: String]?
  
  /// Url encoded parameters
  var parameters: [String: Any]?
  
  
  /// Initializer to create the object
  ///
  ///
  /// - parameters:
  ///   - url: url to requst the API as `String` parameter.
  ///   - method: API method `Method` parameter.
  ///   - headers: Key:Value dictionay as `[String : String]` parameter.
  ///   - parameters: Key:Value dictionay as `[String : String]` parameter.
  /// - returns: Newly created RequestParameter object.
  fileprivate init(url: String, method: Alamofire.HTTPMethod, headers: [String: String]? = nil, parameters: [String: Any]? = nil) {
    self.url = url
    self.method = method
    self.headers = headers
    self.parameters = parameters
  }
  
 

  /// Creates the simple (not signed) RequestParameter
  ///
  ///
  /// - parameters:
  ///   - url: url to requst the API as `String` parameter.
  ///   - method: API method `Method` parameter.
  ///   - headers: Key:Value dictionay as `[String : String]` parameter.
  ///   - parameters: Key:Value dictionay as `[String : String]` parameter.
  /// - returns: Newly created RequestParameter object.
  public static func createRequestParameter(_ url: String, method: Alamofire.HTTPMethod, headers: [String: String]? = nil, parameters: [String: String]? = nil) -> RequestParameter {
    print("url is : \(url)")
    return RequestParameter(url: url, method: method, headers: headers, parameters: parameters)
  }

}
