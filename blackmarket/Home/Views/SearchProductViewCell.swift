//
//  SearchProductViewCell.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 14/08/2023.
//

import UIKit

class SearchProductViewCell: UITableViewCell {
  
  private lazy var searchField = BaseTextField(
    target: self,
    selector: #selector(selectProduct),
    placeholder: "homescreen_search_product_title".localized,
    borderStyle: .none,
    borderColor: UIColor.clear.cgColor,
    borderWidth: 0.0
  )
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)
    addSubview(searchField)
    
    searchField.translatesAutoresizingMaskIntoConstraints = false
    
    let horizontalMargin: CGFloat = 16.0
    let topMargin: CGFloat = 8.0
    
    NSLayoutConstraint.activate([
      searchField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
      searchField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
      searchField.topAnchor.constraint(equalTo: topAnchor, constant: topMargin),
      searchField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -topMargin)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func selectProduct(_ sender: UITextField) {
    // Do nothing
  }
}
