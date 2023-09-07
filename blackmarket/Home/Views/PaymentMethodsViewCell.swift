//
//  PaymentMethodsViewCell.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 06/09/2023.
//

import UIKit
import SwiftUI

class PaymentMethodsViewCell: UITableViewCell {
  
  private lazy var title = UILabel.titleLabel(
    text: "homescreen_payment_method_title".localized,
    font: .h2Regular,
    textColor: .darkViolet
  )
  private lazy var creditCardTitle = UILabel.titleLabel(
    text: "homescreen_payment_card".localized,
    font: .h5Regular,
    textColor: .darkViolet
  )
  private lazy var paypalTitle = UILabel.titleLabel(
    text: "homescreen_payment_paypal".localized,
    font: .h5Regular,
    textColor: .darkViolet
  )
  private lazy var bitcoinTitle = UILabel.titleLabel(
    text: "homescreen_payment_crypto".localized,
    font: .h5Regular,
    textColor: .darkViolet
  )

  private lazy var creditCardImage = UIImageView()
  private lazy var paypalImage = UIImageView()
  private lazy var bitcoinImage = UIImageView()
  private lazy var dividerImage1 = UIImageView()
  private lazy var dividerImage2 = UIImageView()
  private lazy var cardView = UIView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = .dashboardBackground
    cardView.backgroundColor = .black
    creditCardImage.image = UIImage(named: "black_credit_card")
    paypalImage.image = UIImage(named: "black_paypal")
    bitcoinImage.image = UIImage(named: "black_crypto")
    dividerImage1.image = UIImage(named: "black_divider")
    dividerImage2.image = UIImage(named: "black_divider")
    creditCardImage.contentMode = .scaleAspectFit
    paypalImage.contentMode = .scaleAspectFit
    bitcoinImage.contentMode = .scaleAspectFit
    cardView.addSubview(creditCardImage)
    cardView.addSubview(bitcoinImage)
    cardView.addSubview(paypalImage)
    cardView.addSubview(creditCardTitle)
    cardView.addSubview(bitcoinTitle)
    cardView.addSubview(paypalTitle)
    cardView.addSubview(dividerImage1)
    cardView.addSubview(dividerImage2)
    addSubview(title)
    addSubview(cardView)
    
    
    title.translatesAutoresizingMaskIntoConstraints = false
    cardView.translatesAutoresizingMaskIntoConstraints = false
    creditCardImage.translatesAutoresizingMaskIntoConstraints = false
    bitcoinImage.translatesAutoresizingMaskIntoConstraints = false
    paypalImage.translatesAutoresizingMaskIntoConstraints = false
    creditCardTitle.translatesAutoresizingMaskIntoConstraints = false
    bitcoinTitle.translatesAutoresizingMaskIntoConstraints = false
    paypalTitle.translatesAutoresizingMaskIntoConstraints = false
    dividerImage1.translatesAutoresizingMaskIntoConstraints = false
    dividerImage2.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      title.topAnchor.constraint(equalTo: topAnchor, constant: 41),
      title.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      cardView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 41),
      cardView.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      creditCardImage.topAnchor.constraint(equalTo: cardView.topAnchor),
      
      creditCardTitle.topAnchor.constraint(equalTo: creditCardImage.bottomAnchor, constant: 24),
      creditCardTitle.leadingAnchor.constraint(equalTo: creditCardImage.leadingAnchor),
      creditCardTitle.trailingAnchor.constraint(equalTo: creditCardImage.trailingAnchor),
      
      dividerImage1.topAnchor.constraint(equalTo: cardView.topAnchor),
      dividerImage1.leadingAnchor.constraint(equalTo: creditCardImage.trailingAnchor, constant: 22),
      
      paypalImage.topAnchor.constraint(equalTo: cardView.topAnchor),
      paypalImage.trailingAnchor.constraint(equalTo: dividerImage2.leadingAnchor, constant: -22),
      paypalImage.leadingAnchor.constraint(equalTo: dividerImage1.trailingAnchor, constant: 22),
      paypalImage.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
      
      paypalTitle.topAnchor.constraint(equalTo: paypalImage.bottomAnchor, constant: 21),
      paypalTitle.leadingAnchor.constraint(equalTo: paypalImage.leadingAnchor),
      paypalTitle.trailingAnchor.constraint(equalTo: paypalImage.trailingAnchor),
      
      dividerImage2.topAnchor.constraint(equalTo: cardView.topAnchor),
      dividerImage2.trailingAnchor.constraint(equalTo: bitcoinImage.leadingAnchor, constant: -22),
      
      bitcoinImage.topAnchor.constraint(equalTo: cardView.topAnchor),
      
      bitcoinTitle.topAnchor.constraint(equalTo: bitcoinImage.bottomAnchor, constant: 22),
      bitcoinTitle.leadingAnchor.constraint(equalTo: bitcoinImage.leadingAnchor),
      bitcoinTitle.trailingAnchor.constraint(equalTo: bitcoinImage.trailingAnchor),
      
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

struct PaymentMethodsViewCell_Previews: PreviewProvider {
  static var previews: some View {
    ViewPreview {
      PaymentMethodsViewCell()
    }
  }
}
