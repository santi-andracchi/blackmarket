import Foundation
import RSSwiftNetworking

internal enum AuthEndpoint: RailsAPIEndpoint {
  
  case signIn(
    email: String,
    password: String
  )
  case signUp(
    email: String,
    password1: String,
    password2: String
  )
  case logout
  case deleteAccount
  
  private static let usersURL = "/users/"
  private static let currentUserURL = "/user/"
  private static let signupURL = "/dj-rest-auth/registration/"
  
  var path: String {
    switch self {
    case .signIn:
      return AuthEndpoint.usersURL + "sign_in"
    case .signUp:
      return AuthEndpoint.signupURL
    case .logout:
      return AuthEndpoint.usersURL + "sign_out"
    case .deleteAccount:
      return AuthEndpoint.currentUserURL + "delete_account"
    }
  }
  
  var method: Network.HTTPMethod {
    switch self {
    case .signIn, .signUp:
      return .post
    case .logout, .deleteAccount:
      return .delete
    }
  }
  
  var parameters: [String: Any] {
    switch self {
    case .signIn(let email, let password):
      return [
        "user": [
          "email": email,
          "password": password
        ]
      ]
    case .signUp(let email, let password1, let password2):
      //                 , let picture):
      var parameters = [
        "email": email,
        "password1": password1,
        "password2": password2
      ]
      //      if let pictureData = picture {
      //        parameters["image"] = pictureData.asBase64Param()
      //      }
      return ["user": parameters]
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
    case .signIn, .signUp:
      return .httpBody(.json)
    default:
      return .urlQuery
    }
  }
}
