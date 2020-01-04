//
//  NetworkManagerWrapper.swift

import Foundation
import Alamofire

public typealias SuccessClosure = (_ data: Data?) -> (Void)
public typealias FailureClosure = (_ error: Error?, _ data: Data?, _ statusCode: Int?) -> (Void)


class NetworkManagerWrapper: NSObject {
  
  /// Makes the request.
  ///
  ///
  /// - parameters:
  ///   - requestParamter: `RequestParameter` parameter.
  ///   - success: success closure `SuccessClosure` parameter.
  ///   - failure: failure closure as `FailureClosure` parameter.
  /// - returns: `Request` object.
  static func makeRequest(_ requestParamter: RequestParameter, encoding: ParameterEncoding = URLEncoding.default, success: @escaping SuccessClosure, failure: @escaping FailureClosure) -> Request {

    let request = Alamofire.request(requestParamter.url, method: requestParamter.method, parameters: requestParamter.parameters, encoding: encoding, headers: requestParamter.headers)
    //get the response
    request.responseData { (dataResponse) in
      // Do conversion of data to json and the "data" parsing in background thread
      // Just to make UI thread more free form these kind of jobs.
      
      // for debuggin only since we don't want this computation for release/production
      #if DEBUG
        if let data = dataResponse.result.value {
          let responseString = String(data: data, encoding: .utf8)
          if responseString != nil {
            print("Response string:\(responseString!)")
          }
          else {
            print("Response string is null")
          }
        }
      #endif

      if let error = dataResponse.result.error {
        // error could be any of the NSURLErrorDomain like NSURLErrorCannotFindHost
        print(error)
        failure(error, dataResponse.result.value, nil)
      }
      else if dataResponse.response?.statusCode == 200 || dataResponse.response?.statusCode == 201 {
        success(dataResponse.result.value)

//        if requestParamter.url == Url.verify {
//          //if let accessToken = dataResponse.response?.allHeaderFields["access_token"] as? String {
//            // Save Access Token
//            //UserDefaults.standard.set(accessToken, forKey: Constants.UserDefault.accessToken)
//          }
//        }
      } else {
        // if status code is not 200 (success)
        failure(nil, dataResponse.result.value, dataResponse.response?.statusCode)
      }
    }
    return request
  }

}
