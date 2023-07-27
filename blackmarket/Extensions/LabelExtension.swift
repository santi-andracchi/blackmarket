import Foundation
import UIKit

extension UILabel {
  
  static func titleLabel (
    text: String = "",
    font: UIFont = .h4Regular,
    textColor: UIColor = .yellow,
    backgroundColor: UIColor = .clear,
    numberOfLines: Int = 0,
    textAlignment: NSTextAlignment = .left
  ) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.font = font
    label.textColor = textColor
    label.backgroundColor = backgroundColor
    label.numberOfLines = numberOfLines
    label.textAlignment = textAlignment
    
    return label
  }
}
