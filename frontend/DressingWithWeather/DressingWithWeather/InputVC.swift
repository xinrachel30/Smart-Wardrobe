//
//  ViewController.swift
//  DressingWithWeather
//
//  Created by Aiden Montesinos on 11/29/23.
//

import UIKit
import Alamofire

class InputVC: UIViewController {
    
    private let questionTextView = UITextView()
    private let weatherTextField = UITextField()
    private let wearButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        
        setUpQuestion()
        setUpWeatherTF()
        setUpButton()
        
        setupConstraints()
    }
    
    func setUpQuestion(){
        questionTextView.text = "What’s the Weather?"
        questionTextView.translatesAutoresizingMaskIntoConstraints = false
        questionTextView.font = .systemFont(ofSize:25, weight: .regular)
        questionTextView.backgroundColor = .clear
        questionTextView.isEditable = false
        view.addSubview(questionTextView)
    }
    
    func setUpWeatherTF(){
        weatherTextField.placeholder = "Forsure enter something"
        weatherTextField.translatesAutoresizingMaskIntoConstraints = false
        weatherTextField.font = .systemFont(ofSize:25, weight: .regular)
        weatherTextField.backgroundColor = .orange
        view.addSubview(weatherTextField)
    }
    
    func setUpButton(){
        wearButton.setTitle("Show me what to wear!", for: .normal)
        wearButton.translatesAutoresizingMaskIntoConstraints = false
        wearButton.backgroundColor = .systemBlue
        wearButton.layer.cornerRadius = 25
        wearButton.addTarget(self, action: #selector(pushView), for: .touchUpInside)
        view.addSubview(wearButton)
        
    }
    
    @objc func pushView(){
        // delegation for later
        //let viewControllerResults = ResultsVC()
        navigationController?.pushViewController(ResultsVC(), animated: true)
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            questionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            questionTextView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            questionTextView.bottomAnchor.constraint(equalTo: questionTextView.topAnchor, constant: 50),
            questionTextView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -120)
        ])
        
        NSLayoutConstraint.activate([
            weatherTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            wearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wearButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            wearButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            wearButton.bottomAnchor.constraint(equalTo: wearButton.topAnchor, constant: 50),
            wearButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -120)
        ])
        
    }
    
    
    
}
        

    
