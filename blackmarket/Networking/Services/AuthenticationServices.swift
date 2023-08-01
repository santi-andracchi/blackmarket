import Foundation
import UIKit
import RSSwiftNetworking

internal class AuthenticationServices {

  enum AuthError: Error {
    case userSessionInvalid
  }

  // MARK: - Properties
  
  fileprivate static let usersUrl = "/users/"
  fileprivate static let currentUserUrl = "/user/"

  private let sessionManager: SessionManager

  private let apiClient: APIClient

  init(
    sessionManager: SessionManager = .shared,
    apiClient: APIClient = iOSBaseAPIClient.shared
  ) {
    self.sessionManager = sessionManager
    self.apiClient = apiClient
  }
  
  func login(
    email: String,
    password: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    apiClient.request(
      endpoint: AuthEndpoint.signIn(email: email, password: password)
    ) { [weak self] (result: Result<User?, Error>, responseHeaders: [AnyHashable: Any]) in
      switch result {
        case .success(let user):
          if self?.saveUserSession(user, headers: responseHeaders) ?? false {
            completion(.success(()))
          } else {
            completion(.failure(AuthError.userSessionInvalid))
          }
        case .failure(let error):
          completion(.failure(error))
        }
    }
  }

  
  /// Example method that uploads base64 encoded image.
  func signup(
    email: String,
    password: String,
    avatar64: UIImage,
    completion: @escaping (Result<User, Error>) -> Void
  ) {
    apiClient.request(
      endpoint: AuthEndpoint.signUp(
        email: email,
        password1: password,
        password2: password
//        picture: avatar64.jpegData(compressionQuality: 0.75)
      )
    ) { [weak self] (result: Result<User?, Error>, responseHeaders) in
      switch result {
      case .success(let user):
        if
          let user = user,
          self?.saveUserSession(user, headers: responseHeaders) ?? false
        {
          completion(.success(user))
        } else {
          completion(.failure(AuthError.userSessionInvalid))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  func logout(completion: @escaping (Result<Void, Error>) -> Void) {
    apiClient.request(
      endpoint: AuthEndpoint.logout
    ) { [weak self] (result: Result<Network.EmptyResponse?, Error>, _) in
      switch result {
      case .success:
        UserDataManager.deleteUser()
        self?.sessionManager.deleteSession()
        completion(.success(()))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  func deleteAccount(completion: @escaping (Result<Void, Error>) -> Void) {
    apiClient.request(
      endpoint: AuthEndpoint.deleteAccount
    ) { [weak self] (result: Result<Network.EmptyResponse?, Error>, _) in
      switch result {
      case .success:
        UserDataManager.deleteUser()
        self?.sessionManager.deleteSession()
        completion(.success(()))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  private func saveUserSession(
    _ user: User?,
    headers: [AnyHashable: Any]
  ) -> Bool {
    UserDataManager.currentUser = user
    sessionManager.currentSession = Session(headers: headers)

    return UserDataManager.currentUser != nil && sessionManager.validSession
  }
}
