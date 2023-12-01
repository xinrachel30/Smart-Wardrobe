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
    
    private var article: String!
    private var clothing: [String]!
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .white
//
//        layer.cornerRadius = 16
//        setUpItem()
//    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpItem()
    }
    
//pass through configurw to get article and clothing

//    init(article: String, clothing: [String]) {
//        super.init(frame: CGRect())
//        self.article = article
//        self.clothing = clothing
//
//        setUpItem()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.backgroundColor = .white
//        setUpItem()
//    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpItem() {
        //TODO: make the size of the cells readable
        item.text = "Anonymous"
        item.font = .systemFont(ofSize: 19)

        item.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(item)

        NSLayoutConstraint.activate([
            item.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            item.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            item.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            item.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //
    
    
    
}
