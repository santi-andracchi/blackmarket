import UIKit
import RSFontSizes

extension UIFont {
  
  static let h0Black = Font.dmSansBlack.uiFont(withSize: .heading0)
  static let h1Black = Font.dmSansBlack.uiFont(withSize: .heading1)
  static let h2Black = Font.dmSansBlack.uiFont(withSize: .heading2)
  static let h3Black = Font.dmSansBlack.uiFont(withSize: .heading3)
  static let h4Black = Font.dmSansBlack.uiFont(withSize: .heading4)
  static let h5Black = Font.dmSansBlack.uiFont(withSize: .heading5)
  static let h6Black = Font.dmSansBlack.uiFont(withSize: .heading6)
  
  static let h1Bold = Font.dmSansBold.uiFont(withSize: .heading1)
  static let h2Bold = Font.dmSansBold.uiFont(withSize: .heading2)
  static let h3Bold = Font.dmSansBold.uiFont(withSize: .heading3)
  static let h4Bold = Font.dmSansBold.uiFont(withSize: .heading4)
  static let h5Bold = Font.dmSansBold.uiFont(withSize: .heading5)
  static let h6Bold = Font.dmSansBold.uiFont(withSize: .heading6)
  
  static let h1Medium = Font.dmSansMedium.uiFont(withSize: .heading1)
  static let h2Medium = Font.dmSansMedium.uiFont(withSize: .heading2)
  static let h3Medium = Font.dmSansMedium.uiFont(withSize: .heading3)
  static let h4Medium = Font.dmSansMedium.uiFont(withSize: .heading4)
  static let h5Medium = Font.dmSansMedium.uiFont(withSize: .heading5)
  static let h6Medium = Font.dmSansMedium.uiFont(withSize: .heading6)
  
  static let h1Regular = Font.dmSansRegular.uiFont(withSize: .heading1)
  static let h2Regular = Font.dmSansRegular.uiFont(withSize: .heading2)
  static let h3Regular = Font.dmSansRegular.uiFont(withSize: .heading3)
  static let h4Regular = Font.dmSansRegular.uiFont(withSize: .heading4)
  static let h5Regular = Font.dmSansRegular.uiFont(withSize: .heading5)
  static let h6Regular = Font.dmSansRegular.uiFont(withSize: .heading6)
  
  private func withWeight(_ weight: UIFont.Weight) -> UIFont {
    var attributes = fontDescriptor.fontAttributes
    var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]
    
    traits[.weight] = weight
    
    attributes[.name] = nil
    attributes[.traits] = traits
    attributes[.family] = familyName
    
    let descriptor = UIFontDescriptor(fontAttributes: attributes)
    
    return UIFont(descriptor: descriptor, size: pointSize)
  }
  
  static func font(withName name: String = "", size: Sizes) -> UIFont {
    name.font(
      withWeight: .normal,
      size: PointSize.proportional(to: (.screen6_5Inch, size.rawValue))
    ) ?? UIFont.systemFont(ofSize: size.rawValue)
  }
}

// MARK: Custom fonts
private enum Font: String {
  case dmSansBlack = "DMSans-Black"
  case dmSansBlackItalic = "DMSans-BlackItalic"
  case dmSansBold = "DMSans-Bold"
  case dmSansBoldItalic = "DMSans-BoldItalic"
  case dmSansItalic = "DMSans-Italic"
  case dmSansLight = "DMSans-Light"
  case dmSansLightItalic = "DMSans-LightItalic"
  case dmSansMedium = "DMSans-Medium"
  case dmSansMediumItalic = "DMSans-MediumItalic"
  case dmSansRegular = "DMSans-Regular"
  case dmSansThin = "DMSans-Thin"
  case dmSansThinItalic = "DMSans-ThinItalic"
  
  func uiFont(withSize size: Sizes) -> UIFont {
    UIFont(name: self.rawValue, size: size.rawValue)!
  }
}

public enum Sizes: CGFloat {
  case heading0 = 30.0
  case heading1 = 22.0
  case heading2 = 20.0
  case heading3 = 18.0
  case heading4 = 16.0
  case heading5 = 14.0
  case heading6 = 12.0
}
