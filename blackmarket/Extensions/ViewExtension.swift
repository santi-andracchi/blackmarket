import Foundation
import UIKit

extension UIView {
  
  // MARK: - Instance methods
  
  // Change the default values for params as you wish
  func addBorder(color: UIColor = UIColor.black, weight: CGFloat = 1.0) {
    layer.borderColor = color.cgColor
    layer.borderWidth = weight
  }
  
  func setRoundBorders(_ cornerRadius: CGFloat = 10.0) {
    clipsToBounds = true
    layer.cornerRadius = cornerRadius
  }
  
  var typeName: String {
    String(describing: type(of: self))
  }
  
  func instanceFromNib(withName name: String) -> UIView? {
    UINib(
      nibName: name,
      bundle: nil
    ).instantiate(withOwner: self, options: nil).first as? UIView
  }
  
  func addNibView(
    withNibName nibName: String? = nil,
    withAutoresizingMasks masks: AutoresizingMask = [.flexibleWidth, .flexibleHeight]
  ) -> UIView {
    let name = String(describing: type(of: self))
    guard let view = instanceFromNib(withName: nibName ?? name) else {
      assert(false, "No nib found with that name")
      return UIView()
    }
    view.frame = bounds
    view.autoresizingMask = masks
    addSubview(view)
    return view
  }
  
  func animateChangeInLayout(withDuration duration: TimeInterval = 0.2) {
    setNeedsLayout()
    UIView.animate(withDuration: duration, animations: { [weak self] in
      self?.layoutIfNeeded()
    })
  }
  
  // MARK: Constrains Helper
  
  func addSubviews(subviews: [UIView]) {
    for subview in subviews {
      addSubview(subview)
    }
  }
  
  func attachHorizontally(
    to view: UIView,
    leadingMargin: CGFloat = UI.Defaults.margin,
    trailingMargin: CGFloat = UI.Defaults.margin
  ) {
    NSLayoutConstraint.activate([
      leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
      trailingAnchor.constraint(
        equalTo: view.trailingAnchor,
        constant: -trailingMargin
      )
    ])
  }
  
  func attachVertically(
    to view: UIView,
    topMargin: CGFloat = UI.Defaults.margin,
    bottomMargin: CGFloat = UI.Defaults.margin
  ) {
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: view.topAnchor, constant: topMargin),
      bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomMargin)
    ])
  }
  
  /// Centers the view horizontally and vertically with a specific view
  ///
  /// - Parameters:
  ///   - view: UIView on which the view will be centered horizontally
  ///   - withOffset: CGPoint indicating the horizontal
  ///   and vertical displacement of the view
  func center(_ view: UIView, withOffset offset: CGPoint = .zero) {
    centerHorizontally(with: view, withOffset: offset.x)
    centerVertically(with: view, withOffset: offset.y)
  }
  
  /// Centers the view horizontally with a specific view
  ///
  /// - Parameters:
  ///   - view: UIView on which the view will be centered horizontally
  ///   - withOffset: CGFloat indicating the horizontal displacement of the view
  func centerHorizontally(
    with view: UIView,
    withOffset offset: CGFloat = 0
  ) {
    centerXAnchor.constraint(
      equalTo: view.centerXAnchor,
      constant: offset
    ).isActive = true
  }
  
  /// Centers the view vertically with a specific view
  ///
  /// - Parameters:
  ///   - view: UIView on which the view will be centered vertically
  ///   - withOffset: CGFloat indicating the vertical displacement of the view
  func centerVertically(
    with view: UIView,
    withOffset offset: CGFloat = 0
  ) {
    centerYAnchor.constraint(
      equalTo: view.centerYAnchor,
      constant: offset
    ).isActive = true
  }
  
  enum SeparatorPosition {
    case top
    case bottom
    case left
    case right
  }

  @discardableResult
  func addSeparator(at position: SeparatorPosition, color: UIColor, weight: CGFloat = 1.0 / UIScreen.main.scale, insets: UIEdgeInsets = .zero) -> UIView {
    let view = UIView()
    view.backgroundColor = color
    view.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(view)
    
    switch position {
    case .top:
      view.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top).isActive = true
      view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: insets.left).isActive = true
      view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -insets.right).isActive = true
      view.heightAnchor.constraint(equalToConstant: weight).isActive = true
      
    case .bottom:
      view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -insets.bottom).isActive = true
      view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: insets.left).isActive = true
      view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -insets.right).isActive = true
      view.heightAnchor.constraint(equalToConstant: weight).isActive = true
      
    case .left:
      view.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top).isActive = true
      view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -insets.bottom).isActive = true
      view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: insets.left).isActive = true
      view.widthAnchor.constraint(equalToConstant: weight).isActive = true
      
    case .right:
      view.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top).isActive = true
      view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -insets.bottom).isActive = true
      view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -insets.right).isActive = true
      view.widthAnchor.constraint(equalToConstant: weight).isActive = true
    }
    
    return view
  }
}

extension Array where Element: UIView {
  func addBorder(color: UIColor = UIColor.black, weight: CGFloat = 1.0) {
    for view in self {
      view.addBorder(color: color, weight: weight)
    }
  }
  
  func roundBorders(cornerRadius: CGFloat = 10.0) {
    for view in self {
      view.setRoundBorders(cornerRadius)
    }
  }
}
