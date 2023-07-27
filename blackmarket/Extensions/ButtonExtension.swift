import Foundation
import UIKit

extension UIButton {
  
  static func primaryButton(
    color: UIColor = .black,
    title: String = "",
    titleColor: UIColor = .white,
    cornerRadius: CGFloat = UI.Button.cornerRadius,
    height: CGFloat = UI.Button.height,
    font: UIFont = .h3Medium,
    target: Any? = nil,
    action: Selector? = nil
  ) -> UIButton {
    let button = UIButton()
    button.setup(
      color: color,
      title: title,
      titleColor: titleColor,
      cornerRadius: cornerRadius,
      height: height,
      font: font
    )
    if let action = action {
      button.addTarget(target, action: action, for: .touchUpInside)
    }
    return button
  }

  static func secondaryButton(
    color: UIColor = .black,
    title: String = "",
    titleColor: UIColor = .white,
    cornerRadius: CGFloat = UI.Button.cornerRadius,
    height: CGFloat = UI.Button.height,
    font: UIFont = .h3Medium,
    target: Any? = nil,
    action: Selector? = nil,
    borderCorlor: CGColor = UIColor.black.cgColor,
    borderWidth: CGFloat = 1
  ) -> UIButton {
    let button = UIButton()
    button.setup(
      color: color,
      title: title,
      titleColor: titleColor,
      cornerRadius: cornerRadius,
      height: height,
      font: font
    )
    button.layer.borderColor = borderCorlor
    button.layer.borderWidth = borderWidth
    if let action = action {
      button.addTarget(target, action: action, for: .touchUpInside)
    }
    return button
  }

  
  private func setup(
    color: UIColor = .red,
    title: String = "",
    titleColor: UIColor = .white,
    cornerRadius: CGFloat = UI.Button.cornerRadius,
    height: CGFloat = UI.Button.height,
    font: UIFont = .h3Medium
  ) {
    translatesAutoresizingMaskIntoConstraints = false
    setTitle(title, for: .normal)
    setTitleColor(titleColor, for: .normal)
    backgroundColor = color
    titleLabel?.font = font
    setRoundBorders(cornerRadius)
    heightAnchor.constraint(equalToConstant: height).isActive = true
  }
}
