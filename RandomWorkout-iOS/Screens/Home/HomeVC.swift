//
//  HomeVC.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 14/01/21.
//

import UIKit

class HomeVC: UIViewController {
    
    let titleExerciseLabel = RWTitleLabel(fontSize: 32, textAlignment: .center)
    let countDownLabel = RWTitleLabel(fontSize: 16, textAlignment: .center) // create a custumview->
    let startButton = RWButton(backgroundColor: .systemGreen, title: "Empezar")
    let resetButton = RWButton(backgroundColor: .systemRed, title: "Reiniciar")
    let nextButton = RWButton(backgroundColor: .systemBlue, title: "Siguiente")
    let exerciseView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureExerciseView()
        configureCountDownLabel()
        configureTitleExerciseLabel()
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
            exerciseView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            exerciseView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureCountDownLabel() {
        view.addSubview(countDownLabel)
        countDownLabel.text = "00:00"
        countDownLabel.layer.cornerRadius = 12
        countDownLabel.clipsToBounds = true
        countDownLabel.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            countDownLabel.heightAnchor.constraint(equalToConstant: 24),
            countDownLabel.widthAnchor.constraint(equalToConstant: 70),
            countDownLabel.bottomAnchor.constraint(equalTo: exerciseView.topAnchor, constant: 29),
            countDownLabel.trailingAnchor.constraint(equalTo: exerciseView.trailingAnchor, constant: -5)
        ])
    }
    
    func configureTitleExerciseLabel() {
        view.addSubview(titleExerciseLabel)
        titleExerciseLabel.text = "Trote estatico "
        
        NSLayoutConstraint.activate([
            titleExerciseLabel.heightAnchor.constraint(equalToConstant: 40),
            titleExerciseLabel.leadingAnchor.constraint(equalTo: exerciseView.leadingAnchor),
            titleExerciseLabel.trailingAnchor.constraint(equalTo: exerciseView.trailingAnchor ),
            titleExerciseLabel.topAnchor.constraint(equalTo: exerciseView.bottomAnchor, constant: 20)
        ])
    }
    
    func configureStartButton() {
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.widthAnchor.constraint(equalToConstant: 260),
            startButton.topAnchor.constraint(equalTo: titleExerciseLabel.bottomAnchor, constant: 20),
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
