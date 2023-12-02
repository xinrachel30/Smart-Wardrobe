//
//  StickmanVC.swift
//  DressingWithWeather
//
//  Created by Aiden Montesinos on 11/30/23.
//

import UIKit

class StickmanClothingCell: UICollectionViewCell {
    private let item = UILabel()
    private let clothing = UITableView()
    
    private var numLikes: Int = 0
    static let reuse: String = "StickmanClothingReuse"
    
    
//    private var response: [String: [String]]
    private var post: weatherResponse?
    private var piece = UILabel()
    private var tops: [String] = []
    private var bottoms: [String] = []
    private var shoes: [String] = []
//    private var article: String!
//    private var clothing: [String]!
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        layer.masksToBounds = false
        setUpItem()
        setUpSmallCollection()
    }
    
    var cornerRadius: CGFloat = 5.0

        override func awakeFromNib() {
            super.awakeFromNib()
                
            // Apply rounded corners to contentView
            contentView.layer.cornerRadius = cornerRadius
            contentView.layer.masksToBounds = true
            
            // Set masks to bounds to false to avoid the shadow
            // from being clipped to the corner radius
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = false
            
            // Apply a shadow
            layer.shadowRadius = 8.0
            layer.shadowOpacity = 0.10
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 5)
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
        item.font = .systemFont(ofSize: 15)

        item.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(item)

        NSLayoutConstraint.activate([
            item.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            item.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            item.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            item.bottomAnchor.constraint(equalTo: item.topAnchor, constant: 100)
        ])
    }
    
    private func setUpSmallCollection() {
        //TODO: make the size of the cells readable
        clothing.translatesAutoresizingMaskIntoConstraints = false
        clothing.rowHeight = UITableView.automaticDimension
        clothing.estimatedRowHeight = 44
        clothing.backgroundColor = .green
        
        piece.text = "Word"
        piece.translatesAutoresizingMaskIntoConstraints = false
        clothing.addSubview(piece)
        
        clothing.register(UITableViewCell.self, forCellReuseIdentifier: "ClothingReuse")
        clothing.dataSource = self

        contentView.addSubview(clothing)

        NSLayoutConstraint.activate([
            clothing.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            clothing.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            clothing.topAnchor.constraint(equalTo: contentView.centerYAnchor),
            clothing.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            piece.leadingAnchor.constraint(equalTo: clothing.leadingAnchor),
            piece.trailingAnchor.constraint(equalTo: clothing.trailingAnchor),
            piece.topAnchor.constraint(equalTo: clothing.topAnchor),
            piece.bottomAnchor.constraint(equalTo:clothing.bottomAnchor)
        ])
    }
    
    
    func config (post: weatherResponse){
        tops = post.tops
        bottoms = post.bottoms
        shoes = post.shoes
        
        self.post = post
        //this is setting the outer scope post to be equal to the post that's getting passed into config()
    }
    
}

extension StickmanClothingCell: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = clothing.dequeueReusableCell(withIdentifier: "ClothingReuse", for: indexPath)
        cell.backgroundColor = .darkGray
        return cell
    }
    
    
}
