//
//  ProductListCell.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 05/09/2023.
//

import Foundation
import UIKit
import SwiftUI

class ProductListCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  // Create the collection view
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    return collectionView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    // Register your collection view cell class here
    collectionView.register(ProductViewCell.self, forCellWithReuseIdentifier: "ProductViewCell")
    
    // Set the data source and delegate for the collection view
    collectionView.dataSource = self
    collectionView.delegate = self
    
    // Add the collection view to the cell's content view
    collectionView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)
    backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)
    contentView.addSubview(collectionView)
    
    // Add constraints for the collection view
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.showsHorizontalScrollIndicator = false
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26),
      collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
      collectionView.heightAnchor.constraint(equalToConstant: 196) // Set the desired height
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // Return the number of items in the collection view
    return 9 // Replace with your data source
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell
    // Configure the collection view cell here based on your data source
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // Return the size for each cell
    return CGSize(width: 136, height: 196) // Adjust the width and height as needed
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    // Return the minimum line spacing between cells (vertical spacing)
    return 16 // Adjust as needed
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    // Return the minimum interitem spacing between cells (horizontal spacing)
    return 0 // Adjust as needed
  }
}

struct ProductListCell_Previews: PreviewProvider {
  static var previews: some View {
    ViewPreview {
      ProductListCell()
    }
  }
}
