//
//  Url.swift

import Foundation

open class Url {
  // Host of our application
  //staging
  #if PRODUCTION //production
   private static let host = "http://13.234.111.149:4000"
  #else

  private static let host = "http://13.234.111.149:4000"
  #endif

  private static let api = "api/"
  private static let endUrl = host + "/" + api

  fileprivate static let auth = "user/"
  fileprivate static let misc = "/misc/"

  public static let login = endUrl + auth + Endpoint.login
  public static let loginWithGoogle = endUrl + auth + Endpoint.loginWithGoogle
  public static let logout = endUrl + auth + Endpoint.logout
  public static let sendotp = endUrl + auth + Endpoint.otp
  public static let password = endUrl + auth + Endpoint.password
  public static let register = endUrl + auth + Endpoint.register
  public static let verify = endUrl + auth + Endpoint.verify
  public static let product = endUrl + Endpoint.products
  public static let locations = endUrl  + Endpoint.locations
  public static let warehouse = endUrl  + Endpoint.warehouse
  public static let cart = endUrl  + Endpoint.cart
  public static let productDetails = endUrl  + Endpoint.productDetails
  public static let address = endUrl  + auth + Endpoint.address
  public static let payment = endUrl  + Endpoint.order

  public static let categories = endUrl + Endpoint.categories
  public static let timeslots = endUrl + Endpoint.timeslots
  public static let orderHistory = endUrl + Endpoint.orderHistory


  open class Endpoint {
    fileprivate static let login = "login"
    fileprivate static let loginWithGoogle = "loginWithGoogle"
    fileprivate static let logout = "logout"
    fileprivate static let otp = "otp"
    fileprivate static let password = "password"
    fileprivate static let register = "register"
    fileprivate static let verify = "verify"
    fileprivate static let products = "products"
    fileprivate static let locations = "locations"
    fileprivate static let warehouse = "warehouse"
    fileprivate static let cart = "cart"
    fileprivate static let productDetails = "productDetails"
    fileprivate static let address = "address"
    fileprivate static let order = "order"
    fileprivate static let categories = "categories"
    fileprivate static let timeslots = "timeslots"
    fileprivate static let orderHistory = "orderHistory"

    
  }
}
