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
    private let cloudImage = UIImageView()
    public var temp: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "Input Weather!"
        view.backgroundColor = UIColor(named: "babyBlue")
        
        
        setUpQuestion()
        setUpButton()
        setupCloud()
        setUpWeatherTF()
        
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
        weatherTextField.placeholder = "Enter in °F"
        weatherTextField.translatesAutoresizingMaskIntoConstraints = false
        weatherTextField.font = .systemFont(ofSize:25, weight: .regular)
        weatherTextField.backgroundColor = UIColor(named: "lightBlue")
        view.addSubview(weatherTextField)
    }
    
    func setupCloud(){
        cloudImage.image = UIImage(named: "Cloud BG")
        cloudImage.layer.masksToBounds = true
        cloudImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cloudImage)
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
        let viewControllerInput = ResultsVC(delegate: self, string: weatherTextField.text!)
        navigationController?.pushViewController(viewControllerInput, animated: true)
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            questionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 81),
            questionTextView.trailingAnchor.constraint(equalTo: questionTextView.leadingAnchor, constant: 250),
            questionTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 234),
            questionTextView.bottomAnchor.constraint(equalTo: questionTextView.topAnchor, constant: 50)
            
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
        
        NSLayoutConstraint.activate([
            cloudImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 310),
            cloudImage.bottomAnchor.constraint(equalTo: cloudImage.topAnchor, constant: 148),
            cloudImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 73),
            cloudImage.trailingAnchor.constraint(equalTo: cloudImage.leadingAnchor, constant: 244.2)
        ])
        
        
    }
    
    
    
}
extension InputVC: temperatureNumber {
    func getTemperature(temperature: String) {
        temp = temperature
    }
}

    
