//
//  HeaderViewCell.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 12/08/2023.
//

import UIKit

class HeaderViewCell: UITableViewCell {
  
  private lazy var icon = UIImageView()
  private lazy var title = UIImageView()
  private lazy var mainView = UIView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    icon.image = UIImage(named: "blackmarket_header_icon")
    title.image = UIImage(named: "blackmarket_header_title")
    title.contentMode = .scaleAspectFit
    mainView.addSubview(icon)
    mainView.addSubview(title)
    backgroundColor = .black
    addSubview(mainView)
    
    mainView.translatesAutoresizingMaskIntoConstraints = false
    icon.translatesAutoresizingMaskIntoConstraints = false
    title.translatesAutoresizingMaskIntoConstraints = false
    
    let topMargin: CGFloat = 16.0
    
    NSLayoutConstraint.activate([
      mainView.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      icon.topAnchor.constraint(equalTo: topAnchor, constant: topMargin),
      icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -topMargin),
      
      title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 9),
      title.centerXAnchor.constraint(equalTo: centerXAnchor),
      title.topAnchor.constraint(equalTo: icon.topAnchor),
      title.bottomAnchor.constraint(equalTo: icon.bottomAnchor)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
