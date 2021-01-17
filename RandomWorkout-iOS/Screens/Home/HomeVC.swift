//
//  HomeVC.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 14/01/21.
//

import UIKit

class HomeVC: UIViewController {
    
    let startButton = RWButton(backgroundColor: .systemGreen, title: "Empezar")
    let resetButton = RWButton(backgroundColor: .systemRed, title: "Reiniciar")
    let nextButton = RWButton(backgroundColor: .systemBlue, title: "Siguiente")
    let exerciseView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureExerciseView()
        configureStartButton()
        configureResetButton()
        configureNextButton()
    }
    
    func configureExerciseView() {
        view.addSubview(exerciseView)
        exerciseView.translatesAutoresizingMaskIntoConstraints = false
        exerciseView.backgroundColor = .tertiarySystemGroupedBackground
        exerciseView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            exerciseView.heightAnchor.constraint(equalToConstant: 350),
            exerciseView.widthAnchor.constraint(equalToConstant: 300),
            exerciseView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            exerciseView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func configureStartButton() {
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.widthAnchor.constraint(equalToConstant: 260),
            startButton.topAnchor.constraint(equalTo: exerciseView.bottomAnchor, constant: 36),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.widthAnchor.constraint(equalToConstant: 120),
            resetButton.leadingAnchor.constraint(equalTo: startButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 18)
        ])
    }
    
    func configureNextButton() {
        view.addSubview(nextButton)        
        NSLayoutConstraint.activate([
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.trailingAnchor.constraint(equalTo: startButton.trailingAnchor),
            nextButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 18)
        ])
    }
    
}
