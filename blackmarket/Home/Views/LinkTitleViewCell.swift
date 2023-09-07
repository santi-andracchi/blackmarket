//
//  LinkTitleTableViewCell.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 14/08/2023.
//

import UIKit
import SwiftUI

class LinkTitleViewCell: UITableViewCell {
  
  private lazy var linkTextLabel = UILabel.titleLabel(
    text: "homescreen_see_all_text".localized,
    font: .h4Bold,
    textColor: .textLink
  )
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)
    addSubview(linkTextLabel)
    
    linkTextLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      linkTextLabel.topAnchor.constraint(equalTo: topAnchor),
      linkTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  struct LinkTitleViewCell_Previews: PreviewProvider {
    static var previews: some View {
      ViewPreview {
        LinkTitleViewCell()
      }
    }
  }
}
