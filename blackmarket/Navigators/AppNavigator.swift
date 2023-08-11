import Foundation

internal class AppNavigator: BaseNavigator {
  
  static let shared = AppNavigator(isLoggedIn: SessionManager.shared.currentSession != nil)
  
  init(isLoggedIn: Bool) {
    let initialRoute: Route = isLoggedIn
    ? HomeRoutes.home
    : OnboardingRoutes.firstScreen
    super.init(with: initialRoute)
  }
  
  required init(with route: Route) {
    super.init(with: route)
  }
}
