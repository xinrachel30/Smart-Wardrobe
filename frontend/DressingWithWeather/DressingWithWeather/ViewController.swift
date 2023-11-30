//
//  ViewController.swift
//  DressingWithWeather
//
//  Created by Aiden Montesinos on 11/29/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private var tableView: UITableView {
        let cells = UITableView()
        cells.translatesAutoresizingMaskIntoConstraints = false
        cells.backgroundColor = .systemMint
        cells.rowHeight = UITableView.automaticDimension
        cells.estimatedRowHeight = 44
        cells.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return cells
    }
    
    // MARK: - Properties (data)
    //let InputMe:UITextField
    
    // MARK: - viewDidLoad
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ChatDev"
        view.backgroundColor = .blue
        setupCollectionView()
    }
    
        
        
    
    // MARK: - Set Up Views
    
    private func setupCollectionView() {
        // TODO: Set Up CollectionView
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    


// MARK: - UICollectionViewDelegate


// MARK: - UICollectionViewDataSource



// MARK: - UICollectionViewDelegateFlowLayout

}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    
}
