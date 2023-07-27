import UIKit

let button = UIButton(type: .custom)

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
    roundedBorders: Double = 8.0
  ) {
    self.init()
    
    translatesAutoresizingMaskIntoConstraints = false
    addTarget(target, action: selector, for: .editingChanged)
    self.placeholder = placeholder
    self.backgroundColor = backgroundColor
    self.borderStyle = borderStyle
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
  
  func enablePasswordToggle() {
      button.setImage(UIImage(named: "visibility_off"), for: .normal)
      button.setImage(UIImage(named: "visibility_on"), for: .selected)
      button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
      button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
      rightView = button
      rightViewMode = .always
      button.alpha = 0.4
  }
  
  @objc func togglePasswordView(_ sender: Any) {
      isSecureTextEntry.toggle()
      button.isSelected.toggle()
  }
}
