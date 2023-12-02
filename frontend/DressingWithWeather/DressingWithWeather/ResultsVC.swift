//
//  ViewController.swift
//  DressingWithWeather
//
//  Created by Aiden Montesinos on 11/29/23.
//

import UIKit

class ResultsVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private lazy var collectionView: UICollectionView = {
        let cells = UICollectionView()
        cells.translatesAutoresizingMaskIntoConstraints = false
        cells.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return cells
    }()
    
    // MARK: - Properties (data)
    
    var posters:[String] = []
    var temp: String = ""
    let stickman = UIImageView()
    weak var delly: temperatureNumber?
    
    //let InputMe:UITextField
    
    // MARK: - viewDidLoad
    
    override func loadView() {
        super.loadView()
        setupCollectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = temp
        
        setupStick()
        setupConstraints()
        
    }
    
    init(delegate:temperatureNumber ,string: String) {
        super.init(nibName: nil, bundle: nil)
        delly = delegate
        temp = string
        title = temp
        print("in here")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStick(){
        stickman.image = UIImage(named: "Stick Figure")
        stickman.layer.masksToBounds = true
        stickman.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stickman)
    }
     
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stickman.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 138.41),
            stickman.trailingAnchor.constraint(equalTo: stickman.leadingAnchor, constant: 113.641),
            stickman.topAnchor.constraint(equalTo: view.topAnchor, constant: 174),
            stickman.bottomAnchor.constraint(equalTo: stickman.topAnchor, constant: 336.269)
        ])
    }
        
}
        
        
    
    // MARK: - Set Up Views
    private extension ResultsVC {
        func setupCollectionView() {
            // TODO: Set Up CollectionView
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
            collectionView.backgroundColor = .clear
            
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(StickmanClothingCell.self, forCellWithReuseIdentifier: StickmanClothingCell.reuse)
            collectionView.register(StickmanClothingCell.self, forCellWithReuseIdentifier: StickmanClothingCell.reuse)
            collectionView.dataSource = self
            collectionView.delegate = self
            
            view.addSubview(collectionView)
            
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                collectionView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
                collectionView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: 100)
            ])
        }
    }
    
    


// MARK: - UITableViewDelegate


// MARK: - UITableViewViewDataSource



// MARK: - UITableViewDelegateFlowLayout



extension ResultsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 129, height: 146)
    }
    
}
extension ResultsVC:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            
            return 3
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
    
//    @objc func pushView(){
//        let viewControllerEdit = ResultScreenVC(delegate: self)
//        navigationController?.pushViewController(viewControllerEdit, animated: true)
//    }
    
}

protocol temperatureNumber: InputVC {
    func getTemperature(temperature:String)
}
