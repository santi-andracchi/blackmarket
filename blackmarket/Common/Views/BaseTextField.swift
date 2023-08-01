//
//  BaseTextField.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 27/07/2023.
//

import Foundation
import UIKit

final class BaseTextField: UITextField {
  
  let padding = UIEdgeInsets(
    top: 5,
    left: 12,
    bottom: 5,
    right: 12
  )
  
  override public func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override public func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
}
