//
//  ResultScreenVC.swift
//  DressingWithWeather
//
//  Created by Aiden Montesinos on 11/30/23.
//

import UIKit

class ResultScreenVC:UIViewController{
    
    let profileImage = UIImageView()
    
    
//    weak var delly: updateTexts?
    
    
    let dimension: CGFloat = 1/3
    
    
    func setProfile(profile: UIImageView){
        profile.image = UIImage(named: "monkey")
        profile.layer.cornerRadius = ((profile.image?.size.width)!)/2
        profile.layer.masksToBounds = true
        profile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profile)
    }
    
//    func setButton(button: UIButton){
//        button.setTitle("Save", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitleColor(UIColor.a2.white, for: .normal)
//        button.layer.borderWidth = 2
//        button.layer.borderColor = UIColor.a2.silver.cgColor
//        button.backgroundColor = UIColor.a2.systemBlue
//        button.layer.cornerRadius = 5
//        button.addTarget(self, action: #selector(popView), for: .touchUpInside)
//        view.addSubview(button)
//    }
//
//    @objc func popView(){
////        let viewControllerEdit = ProfileVC()
//
//        if !hometownT.text!.isEmpty{
//            delly?.updateHometownT(newText: hometownT.text!)
//        }
//        if !majorT.text!.isEmpty{
//            delly?.updateMajorT(newText: majorT.text!)
//        }
//
//
//        navigationController?.popViewController( animated: true)
//
//    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            title = "Edit Profile"
            
            view.backgroundColor = .white
            
            
            setProfile(profile: profileImage)
            
            setupConstraints()
        }
    
//    init (delegate: updateTexts) {
//        super.init(nibName: nil, bundle: nil)
////        print(delegate.bio)
////        delly = delegate
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: dimension),
            profileImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: dimension),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
}

//protocol updateTexts: ViewController {
//    func updateHometownT(newText:String)
//}
