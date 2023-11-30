//
//  ViewController.swift
//  DressingWithWeather
//
//  Created by Aiden Montesinos on 11/29/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private lazy var tableView: UITableView = {
        let cells = UITableView()
        cells.translatesAutoresizingMaskIntoConstraints = false
        cells.backgroundColor = .orange
        cells.rowHeight = UITableView.automaticDimension
        cells.estimatedRowHeight = 44
        cells.separatorStyle = .none
        cells.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return cells
    }()
    
    // MARK: - Properties (data)
    //let InputMe:UITextField
    
    // MARK: - viewDidLoad
    
    override func loadView() {
        super.loadView()
        setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
}
        
        
    
    // MARK: - Set Up Views
    private extension ViewController{
        func setupTableView() {
            // TODO: Set Up CollectionView
            tableView.dataSource = self
            
            self.view.addSubview(tableView)
            //tableView.backgroundColor = .white
            print("subview")
            NSLayoutConstraint.activate([
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    }
    
    


// MARK: - UITableViewDelegate


// MARK: - UITableViewViewDataSource



// MARK: - UITableViewDelegateFlowLayout


extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        switch indexPath.row{
        case 0:
            cell.backgroundColor = .white
            print("white")
        case 1:
            cell.backgroundColor = .red
        case 2:
            cell.backgroundColor = .green
        default:
            print("default")
            break
        }
        print("")
        return cell
    }
    
    
}
