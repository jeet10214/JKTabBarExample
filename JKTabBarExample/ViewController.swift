//
//  ViewController.swift
//  JKTabBarExample
//
//  Created by Jeet Kapadia on 24/12/22.
//

import UIKit

final class ViewController: UIViewController {

    var tabBarCnt: JKTabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let firstVC = firstVC()
        let secondVC = SeondVC()
        
        let model1 = JKTabBarModel(tabTitle: "home", tabImage: "house", tabSelectedImage: "house.fill", vc: firstVC)
        let model2 = JKTabBarModel(tabTitle: "study", tabImage: "book", tabSelectedImage: "book.fill", vc: secondVC)
        
        tabBarCnt = JKTabBarController(withModel: [model1, model2])
        
        self.view.addSubview((tabBarCnt?.view) ?? UIView())
        tabBarCnt?.view.translatesAutoresizingMaskIntoConstraints = false
        
        tabBarCnt?.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tabBarCnt?.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tabBarCnt?.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tabBarCnt?.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}

final class firstVC: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = .systemPink
    }
}

final class SeondVC: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = .red
    }
}
