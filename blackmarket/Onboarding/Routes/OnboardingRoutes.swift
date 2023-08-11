import Foundation
import UIKit

enum OnboardingRoutes: Route {
  case firstScreen
  case signIn
  case signUp
  
  var screen: UIViewController {
    switch self {
    case .firstScreen:
      return buildSignInViewController()
    case .signIn:
      return buildSignInViewController()
    case .signUp:
      return buildSignUpViewController()
    }
  }
  
  private func buildSignInViewController() -> UIViewController {
    let signIn = SignInViewController(viewModel: SignInViewModelWithCredentials())
    return signIn
  }
  
  private func buildSignUpViewController() -> UIViewController {
    let signUp = SignUpViewController(viewModel: SignUpViewModelWithEmail())
    return signUp
  }
  
  private func buildFirstViewController() -> UIViewController {
    let firstViewController = FirstViewController(viewModel: FirstViewModel())
    return firstViewController
  }
}
