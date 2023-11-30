//
//  ViewController.swift
//  DressingWithWeather
//
//  Created by Aiden Montesinos on 11/29/23.
//

import UIKit

class ViewController: UIViewController{
    
    // MARK: - Properties (view)
    
    private lazy var collectionView: UICollectionView = {
        let cells = UICollectionView()
        cells.translatesAutoresizingMaskIntoConstraints = false
        cells.backgroundColor = .orange
        cells.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return cells
    }()
    
    // MARK: - Properties (data)
    
    var posters:[String] = []
    //let InputMe:UITextField
    
    // MARK: - viewDidLoad
    
    override func loadView() {
        super.loadView()
        setupCollectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
}
        
        
    
    // MARK: - Set Up Views
    private extension ViewController{
        func setupCollectionView() {
            // TODO: Set Up CollectionView
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .vertical
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
            collectionView.backgroundColor = .clear
            
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(StickmanClothingCell.self, forCellWithReuseIdentifier: StickmanClothingCell.reuse)
            collectionView.register(StickmanClothingCell.self, forCellWithReuseIdentifier: StickmanClothingCell.reuse)
            collectionView.dataSource = self
            
            view.addSubview(collectionView)
            
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    }
    
    


// MARK: - UITableViewDelegate


// MARK: - UITableViewViewDataSource



// MARK: - UITableViewDelegateFlowLayout


extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        
        return posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StickmanClothingCell.reuse, for: indexPath) as? StickmanClothingCell else{return UICollectionViewCell()}
        return cell
        
        //these are cells for displaying the items for the stickman to wear
//        else{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StickmanClothingCell.reuse, for: indexPath) as! StickmanClothingCell
//            cell.config(post: posters[indexPath.row])
//            return cell
//        }
    }
}
