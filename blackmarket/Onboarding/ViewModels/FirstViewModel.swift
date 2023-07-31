import Foundation

class FirstViewModel {
  
  var state: AuthViewModelState = .network(state: .idle) {
    didSet {
      delegate?.didUpdateState(to: state)
    }
  }
  
  weak var delegate: AuthViewModelStateDelegate?

  
  // MARK: Facebook callback methods
  
  func facebookLoginRequestSucceded() {
    // Optionally store params (facebook user data) locally.
//    guard let token = AccessToken.current else {
//      return
//    }
      
    // This fails with 404 since this endpoint is not implemented in the API base
    // TODO: remove when implementing login with apple id
//    AuthenticationServices.loginWithFacebook(
//      token: token.tokenString,
//      success: { [weak self] in
//        self?.state = .network(state: .idle)
//        AppNavigator.shared.navigate(to: HomeRoutes.home, with: .changeRoot)
//      },
//      failure: { [weak self] error in
//        self?.state = .network(state: .error(error.localizedDescription))
//    })
  }
  
  func facebookLoginRequestFailed(reason: String, cancelled: Bool = false) {
    state = .network(state: cancelled ? .idle : .error(reason))
  }
  
//  func checkFacebookLoginRequest(result: LoginManagerLoginResult?, error: Error?) {
//    guard let result = result, error == nil else {
//      facebookLoginRequestFailed(reason: error?.localizedDescription ?? "")
//      return
//    }
//    if result.isCancelled {
//      facebookLoginRequestFailed(reason: "User cancelled", cancelled: true)
//    } else if !result.grantedPermissions.contains("email") {
//      facebookLoginRequestFailed(
//        reason: """
//          It seems that you haven't allowed Facebook to provide your email address.
//        """
//      )
//    } else {
//      facebookLoginRequestSucceded()
//    }
//  }
}
