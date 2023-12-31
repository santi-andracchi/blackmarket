import Foundation
import RSSwiftNetworking
import RSSwiftNetworkingAlamofire

internal class UserServices {
  
  enum UserError: LocalizedError {
    case getMyProfile
    case mapping
    
    var errorDescription: String? {
      switch self {
      case .getMyProfile:
        return "authError_login".localized
      case .mapping:
        return "authError_mapping".localized
      }
    }
  }
  
  private let userDataManager: UserDataManager
  private let apiClient = BaseAPIClient.alamofire
  
  init(
    userDataManager: UserDataManager = .shared
  ) {
    self.userDataManager = userDataManager
  }
  
  @discardableResult func getMyProfile() async -> Result<UserData, UserError> {
    let response: RequestResponse<UserData> = await apiClient.request(
      endpoint: UserEndpoint.profile
    )
    switch response.result {
    case .success(let user):
      if let user = user {
        userDataManager.currentUser = user.data
        return .success(user)
      } else {
        return .failure(UserError.mapping)
      }
    case .failure:
      let _ = App.error(
        domain: .parsing,
        localizedDescription: "Could not parse a valid user".localized
      )
      return .failure(UserError.getMyProfile)
    }
  }
}
