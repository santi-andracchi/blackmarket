import Foundation
import UIKit

extension UIViewController {
  // MARK: - Message Error
  func showMessage(
    title: String, message: String,
    handler: ((_ action: UIAlertAction) -> Void)? = nil
  ) {
    let alert = UIAlertController(
      title: title, message: message, preferredStyle: UIAlertController.Style.alert
    )
    alert.addAction(
      UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: handler)
    )
    present(alert, animated: true, completion: nil)
  }
  
  func goToScreen(withIdentifier identifier: String,
                  storyboardId: String? = nil,
                  modally: Bool = false,
                  viewControllerConfigurationBlock: ((UIViewController) -> Void)? = nil) {
    var storyboard = self.storyboard
    
    if let storyboardId = storyboardId {
      storyboard = UIStoryboard(name: storyboardId, bundle: nil)
    }
    
    guard let viewController =
      storyboard?.instantiateViewController(withIdentifier: identifier) else {
        assert(false, "No view controller found with that identifier")
        return
    }
    
    viewControllerConfigurationBlock?(viewController)
    
    if modally {
      present(viewController, animated: true)
    } else {
      assert(navigationController != nil, "navigation controller is nil")
      navigationController?.pushViewController(viewController, animated: true)
    }
  }
  
  func applyDefaultUIConfigs() {
      let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
      backgroundImage.image = UIImage(named: "blackmarket_background.svg")
      backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
      self.view.insertSubview(backgroundImage, at: 0)
  }
}
