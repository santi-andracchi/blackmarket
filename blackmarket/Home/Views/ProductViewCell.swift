import UIKit
import SwiftUI

class ProductViewCell: UICollectionViewCell {
  
  private lazy var favoriteImage = UIImageView()
  private lazy var statusImage = UIImageView()
  private lazy var title = UILabel.titleLabel(
    text: "Baumler",
    font: .h5Bold,
    textColor: .labelTitle)
  private lazy var productImage = UIImageView()
  private lazy var price = UILabel.titleLabel(
    text: "$36",
    font: .h5Bold,
    textColor: .labelTitle)
  private lazy var cardView = UIView()
  private lazy var divider = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    productImage.image = UIImage(named: "chair")
    statusImage.image = UIImage(named: "restored_status")
    favoriteImage.image = UIImage(named: "favorite_white")
    productImage.addSeparator(at: .bottom, color: UIColor(red: 0.388, green: 0.388, blue: 0.388, alpha: 1))
    productImage.contentMode = .scaleAspectFit
    statusImage.contentMode = .scaleAspectFit
    cardView.addSubview(favoriteImage)
    cardView.addSubview(statusImage)
    cardView.addSubview(title)
    cardView.addSubview(productImage)
    cardView.addSubview(price)
    cardView.addSubview(divider)
    backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)
    cardView.backgroundColor = .white
    cardView.layer.cornerRadius = 8.0
    
    addSubview(cardView)
    
    cardView.translatesAutoresizingMaskIntoConstraints = false
    statusImage.translatesAutoresizingMaskIntoConstraints = false
    favoriteImage.translatesAutoresizingMaskIntoConstraints = false
    title.translatesAutoresizingMaskIntoConstraints = false
    productImage.translatesAutoresizingMaskIntoConstraints = false
    price.translatesAutoresizingMaskIntoConstraints = false
    divider.translatesAutoresizingMaskIntoConstraints = false
    
    let cardViewWidth: CGFloat = 136 // Adjust as needed
    let cardViewHeight: CGFloat = 196
    
    NSLayoutConstraint.activate([
      
      cardView.widthAnchor.constraint(equalToConstant: cardViewWidth),
      cardView.heightAnchor.constraint(equalToConstant: cardViewHeight),
      
      productImage.topAnchor.constraint(equalTo: cardView.topAnchor),
      
      price.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
      price.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
      
      statusImage.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
      statusImage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
      
      title.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 17.5),
      title.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
      title.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8),
      
      favoriteImage.topAnchor.constraint(equalTo: statusImage.bottomAnchor, constant: 17.5),
      favoriteImage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
      favoriteImage.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

struct ProductViewCell_Previews: PreviewProvider {
  static var previews: some View {
    ViewPreview {
      ProductViewCell()
    }
  }
}
