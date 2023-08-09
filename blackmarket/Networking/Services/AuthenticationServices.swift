import Foundation
import UIKit
import RSSwiftNetworking
import RSSwiftNetworkingAlamofire

internal class AuthenticationServices {
  
  enum AuthError: LocalizedError {
    case login
    case signUp
    case logout
    case mapping
    case request
    case userSessionInvalid
    
    var errorDescription: String? {
      switch self {
      case .login:
        return "authError_login".localized
      case .signUp:
        return "authError_signUp".localized
      case .logout:
        return "authError_logout".localized
      case .mapping:
        return "authError_mapping".localized
      case .request:
        return "authError_request".localized
      case .userSessionInvalid:
        return "authError_request".localized
      }
    }
  }
  
  // MARK: - Properties
  
  fileprivate static let usersUrl = "/users/"
  fileprivate static let currentUserUrl = "/user/"
  
  private let sessionManager: SessionManager
  private let userDataManager: UserDataManager
  private let apiClient = BaseAPIClient.alamofire
  
  init(
    sessionManager: SessionManager = .shared,
    userDataManager: UserDataManager = .shared
  ) {
    self.sessionManager = sessionManager
    self.userDataManager = userDataManager
  }
  
  func login(
    email: String,
    password: String,
    completion: @escaping (Result<LogInSuccess, Error>) -> Void
  ) {
    apiClient.request(
      endpoint: AuthEndpoint.logIn(email: email, password: password)
    ) { [weak self] (result: Result<LogInSuccess?, Error>, responseHeaders: [AnyHashable: Any]) in
      switch result {
      case .success(let logInSuccess):
        if self?.saveUserSession(user: logInSuccess!.user, accessToken: logInSuccess!.access_token, refreshToken: logInSuccess!.refresh_token) ?? false {
          completion(.success(logInSuccess.unsafelyUnwrapped))
        } else {
          completion(.failure(AuthError.userSessionInvalid))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  func signup(
    email: String,
    password: String,
    avatar64: UIImage,
    completion: @escaping (Result<SignUpSuccess, Error>) -> Void
  ) {
    apiClient.request(
      endpoint: AuthEndpoint.signUp(
        email: email,
        password: password,
        passwordConfirmation: password
      )
    ) { [weak self] (result: Result<SignUpSuccess?, Error>, responseHeaders) in
      switch result {
      case .success(let signupSuccess):
        if
          let signupSuccess = signupSuccess
        {
          completion(.success(signupSuccess))
        } else {
          completion(.failure(AuthError.userSessionInvalid))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  private func saveUserSession(
    user: User?,
    accessToken: String,
    refreshToken: String
  ) -> Bool {
    userDataManager.currentUser = user
    guard let session = Session(user: user, accessToken: accessToken, refreshToken: refreshToken) else { return false }
    sessionManager.saveUser(session: session)
    
    return userDataManager.currentUser != nil && sessionManager.currentSession?.isValid ?? false
  }
}
