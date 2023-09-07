//
//  DiscountAdViewCell.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 06/09/2023.
//

import UIKit
import SwiftUI

class DiscountAdViewCell: UITableViewCell {
  
  private lazy var cardView = UIView()
  private lazy var image = UIImageView()
  private lazy var title = UILabel.titleLabel(
    text: "homescreen_discount_ad_title".localized,
    font: .h5Bold,
    textColor: .white)
  private lazy var subtitle = UILabel.titleLabel(
    text: "homescreen_discount_ad_description".localized,
    font: .h5Regular,
    textColor: .white)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    image.image = UIImage(named: "blackmarket_couch")
    cardView.addSubview(image)
    cardView.addSubview(title)
    cardView.addSubview(subtitle)
    backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)
    cardView.layer.cornerRadius = 8.0
    cardView.backgroundColor = .black
    addSubview(cardView)
    
    cardView.translatesAutoresizingMaskIntoConstraints = false
    image.translatesAutoresizingMaskIntoConstraints = false
    title.translatesAutoresizingMaskIntoConstraints = false
    subtitle.translatesAutoresizingMaskIntoConstraints = false
    
    // Adjust as needed
    let cardViewHeight: CGFloat = 130
    let imageViewWidth: CGFloat = 157 // Adjust as needed
    let imageViewHeight: CGFloat = 130
    let horizontalMargin: CGFloat = 16.0
    
    NSLayoutConstraint.activate([
      
      heightAnchor.constraint(equalToConstant: cardViewHeight),
      cardView.heightAnchor.constraint(equalToConstant: cardViewHeight),
      cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
      cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
      cardView.topAnchor.constraint(equalTo: topAnchor),
      
      image.heightAnchor.constraint(equalToConstant: imageViewHeight),
      image.widthAnchor.constraint(equalToConstant: imageViewWidth),
      image.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
      
      title.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
      title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
      title.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -horizontalMargin),
      
      subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
      subtitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

struct DiscountAdViewCell_Previews: PreviewProvider {
  static var previews: some View {
    ViewPreview {
      DiscountAdViewCell()
    }
  }
}
