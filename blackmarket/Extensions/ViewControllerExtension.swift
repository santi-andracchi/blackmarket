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
  
  func applyDefaultUIConfigs() {
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    backgroundImage.image = UIImage(named: "blackmarket_background.svg")
    backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
    self.view.insertSubview(backgroundImage, at: 0)
  }
}
