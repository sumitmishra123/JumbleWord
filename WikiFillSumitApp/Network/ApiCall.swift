//
//  ApiCall.swift


import Alamofire
//import CommonLib

open class ApiCall {
  
  static let platform = "ios"
  
  /// Authenticate User.
  
  /// - parameters:
  ///   - pageTitleParam: username as `String`.
  ///   - success: success closure `SuccessClosure` parameter.
  ///   - failure: failure closure as `FailureClosure` parameter.
  /// - returns: `Request` object.
  @discardableResult
  public static func getPageTitle(_ pageTitleParam: String, success: @escaping SuccessClosure, failure: @escaping FailureClosure) -> Request {

    let baseUrl = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&titles="
    let url: String = baseUrl + pageTitleParam
    let requestParameter = RequestParameter.createRequestParameter(url, method: .get, parameters: nil)
    return NetworkManagerWrapper.makeRequest(requestParameter, encoding: URLEncoding.httpBody, success: success, failure: failure)
  }
}
