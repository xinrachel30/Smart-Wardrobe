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
        let enterButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        view.addSubview(enterButton)
        enterButton.setTitle(<#T##title: String?##String?#>, for: <#T##UIControl.State#>)
    }
}
        
        
    
    // MARK: - Set Up Views
    private extension ViewController{
        func setupCollectionView() {
            // TODO: Set Up CollectionView
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
            collectionView.backgroundColor = .red
            
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(StickmanClothingCell.self, forCellWithReuseIdentifier: StickmanClothingCell.reuse)
            collectionView.register(StickmanClothingCell.self, forCellWithReuseIdentifier: StickmanClothingCell.reuse)
            collectionView.dataSource = self
            
            view.addSubview(collectionView)
            
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                collectionView.topAnchor.constraint(equalTo: view.centerYAnchor),
                collectionView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: 100)
            ])
        }
    }
    
    


// MARK: - UITableViewDelegate


// MARK: - UITableViewViewDataSource



// MARK: - UITableViewDelegateFlowLayout


extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            print("")
            return 10
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
