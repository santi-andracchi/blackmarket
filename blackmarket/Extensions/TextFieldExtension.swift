import UIKit

extension UITextField {
  
  convenience init(
    target: Any,
    selector: Selector,
    placeholder: String,
    backgroundColor: UIColor = .white,
    height: CGFloat = UI.TextField.height,
    borderStyle: BorderStyle = .line,
    isPassword: Bool = false,
    borderColor: CGColor = UIColor.black.cgColor,
    borderWidth: Double = 1.0,
    roundedBorders: Double = 8.0,
    padding: Int = 12
  ) {
    self.init()
    
    translatesAutoresizingMaskIntoConstraints = false
    addTarget(target, action: selector, for: .editingChanged)
    self.placeholder = placeholder
    self.backgroundColor = backgroundColor
    self.borderStyle = borderStyle
    self.leftView = UIView(frame: CGRect(x: padding, y: padding, width: padding, height: padding))
    self.leftViewMode = .always
    self.layer.borderColor = borderColor
    self.layer.borderWidth = borderWidth
    self.setRoundBorders(roundedBorders)
    heightAnchor.constraint(equalToConstant: height).isActive = true
    isSecureTextEntry = isPassword
  }
  
  func setPlaceholder(color: UIColor = .lightGray) {
    attributedPlaceholder = NSAttributedString(
      string: placeholder ?? "",
      attributes: [NSAttributedString.Key.foregroundColor: color]
    )
  }
}
