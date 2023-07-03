import Foundation
import UIKit

enum HomeRoutes: Route {
  case home

  var screen: UIViewController {
    switch self {
    case .home:
      let home = HomeViewController(viewModel: HomeViewModel())
      return home
    }
  }
}
