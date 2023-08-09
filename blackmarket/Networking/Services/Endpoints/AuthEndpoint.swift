import Foundation
import RSSwiftNetworking

internal enum AuthEndpoint: RailsAPIEndpoint {
  
  case logIn(
    email: String,
    password: String
  )
  case signUp(
    email: String,
    password: String,
    passwordConfirmation: String
  )
  case getProducts
  
  private static let signinURL = "/dj-rest-auth/login/"
  private static let signupURL = "/dj-rest-auth/registration/"
  private static let productsURL = "/api/products/"
  
  var path: String {
    switch self {
    case .logIn:
      return AuthEndpoint.signinURL
    case .signUp:
      return AuthEndpoint.signupURL
    case .getProducts:
      return AuthEndpoint.productsURL
    }
  }
  
  var method: Network.HTTPMethod {
    switch self {
    case .logIn, .signUp:
      return .post
    case .getProducts:
      return .get
    }
  }
  
  var parameters: [String: Any] {
    switch self {
    case .logIn(let email, let password):
      return [
        "email": email,
        "password": password
      ]
    case .signUp(let email, let password, let passwordConfirmation):
      return [
        "email": email,
        "password1": password,
        "password2": passwordConfirmation
      ]
    default:
      return [:]
    }
  }
  
  var headers: [String : String] {
    return [
      HTTPHeader.accept.rawValue: "*/*",
      HTTPHeader.contentType.rawValue: "application/json"
    ]
  }
  
  var parameterEncoding: ParameterEncoding {
    switch self {
    case .logIn, .signUp:
      return .httpBody(.json)
    default:
      return .urlQuery
    }
  }
}
