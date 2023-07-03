import UIKit

protocol ActivityIndicatorPresenter: AnyObject {
  var activityIndicator: UIActivityIndicatorView { get }
  func showActivityIndicator(_ show: Bool)
}

extension ActivityIndicatorPresenter where Self: UIViewController {
  func showActivityIndicator(_ show: Bool) {
    view.isUserInteractionEnabled = !show
    
    guard show else {
      activityIndicator.removeFromSuperview()
      return
    }
    
    if activityIndicator.superview == nil {
      view.addSubview(activityIndicator)
    }
    activityIndicator.color = .black
    activityIndicator.frame = view.bounds
    activityIndicator.startAnimating()
  }
}
