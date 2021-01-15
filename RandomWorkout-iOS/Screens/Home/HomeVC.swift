//
//  HomeVC.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 14/01/21.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        helloWorld()
    }
    
    func helloWorld() {
        // JUST A EXAMPLE :)
        let label = UILabel()
        label.text = "Hello World"
        label.font = UIFont.systemFont(ofSize: 30, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
}
