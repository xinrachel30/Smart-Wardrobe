//
//  StickmanVC.swift
//  DressingWithWeather
//
//  Created by Aiden Montesinos on 11/30/23.
//

import UIKit

class StickmanClothingCell: UICollectionViewCell {
    private let item = UILabel()
    
    private var numLikes: Int = 0
    static let reuse: String = "StickmanClothingReuse"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        layer.cornerRadius = 16
        setUpItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpItem() {
        //TODO: make the size of the cells readable
        item.text = "Anonymous"
        item.font = .systemFont(ofSize: 14)
    
        item.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(item)
        
        NSLayoutConstraint.activate([
            item.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            item.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            item.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            item.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    
}
