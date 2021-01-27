//
//  HomeVC.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 14/01/21.
//

import UIKit
import AVFoundation

class HomeVC: UIViewController {
    
    let titleExerciseLabel = RWTitleLabel(fontSize: 32, textAlignment: .center)
    let descriptionExerciseLabel = RWBodyLabel(textAlignment: .center)
    let countDownLabel = RWTitleLabel(fontSize: 16, textAlignment: .center) // create a custumview->
    let startButton = RWButton(backgroundColor: .systemGreen, title: "Empezar")
    let resetButton = RWButton(backgroundColor: .systemRed, title: "Reiniciar")
    let nextButton = RWButton(backgroundColor: .systemBlue, title: "Siguiente")
    let exerciseVideoView = RWVideoView()
    
    let exerciseModel = ExerciseModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureExerciseView()
        configureCountDownLabel()
        configureTitleExerciseLabel()
        configureDescriptionExerciseLabel()
        configureStartButton()
        configureResetButton()
        configureNextButton()
        showNewExercise()
    }
    
    @objc func showNewExercise() {
        let randomExercise = exerciseModel.getRandomExercise()
        titleExerciseLabel.text = randomExercise.name
        descriptionExerciseLabel.text = randomExercise.descripcion
        exerciseVideoView.prepareVideoLoop(name: randomExercise.videoFileName)
        exerciseVideoView.play()
    }
    
    func configureExerciseView() {
        view.addSubview(exerciseVideoView)
        exerciseVideoView.translatesAutoresizingMaskIntoConstraints = false
        exerciseVideoView.backgroundColor = .tertiarySystemGroupedBackground
        exerciseVideoView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            exerciseVideoView.heightAnchor.constraint(equalToConstant: 350),
            exerciseVideoView.widthAnchor.constraint(equalToConstant: 300),
            exerciseVideoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            exerciseVideoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
            countDownLabel.bottomAnchor.constraint(equalTo: exerciseVideoView.topAnchor, constant: 29),
            countDownLabel.trailingAnchor.constraint(equalTo: exerciseVideoView.trailingAnchor, constant: -5)
        ])
    }
    
    func configureTitleExerciseLabel() {
        view.addSubview(titleExerciseLabel)
        titleExerciseLabel.text = "Trote estatico "
        
        NSLayoutConstraint.activate([
            titleExerciseLabel.heightAnchor.constraint(equalToConstant: 40),
            titleExerciseLabel.leadingAnchor.constraint(equalTo: exerciseVideoView.leadingAnchor),
            titleExerciseLabel.trailingAnchor.constraint(equalTo: exerciseVideoView.trailingAnchor ),
            titleExerciseLabel.topAnchor.constraint(equalTo: exerciseVideoView.bottomAnchor, constant: 5)
        ])
    }
    
    func configureDescriptionExerciseLabel() {
        view.addSubview(descriptionExerciseLabel)
        descriptionExerciseLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            descriptionExerciseLabel.heightAnchor.constraint(equalToConstant: 60),
            descriptionExerciseLabel.topAnchor.constraint(equalTo: titleExerciseLabel.bottomAnchor),
            descriptionExerciseLabel.leadingAnchor.constraint(equalTo: titleExerciseLabel.leadingAnchor),
            descriptionExerciseLabel.trailingAnchor.constraint(equalTo: titleExerciseLabel.trailingAnchor)
        ])
    }
    
    func configureStartButton() {
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.widthAnchor.constraint(equalToConstant: 260),
            startButton.topAnchor.constraint(equalTo: descriptionExerciseLabel.bottomAnchor, constant: 10),
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
        nextButton.addTarget(self, action: #selector(showNewExercise), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.trailingAnchor.constraint(equalTo: startButton.trailingAnchor),
            nextButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 18)
        ])
    }
    
}
