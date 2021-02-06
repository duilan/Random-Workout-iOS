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
    let exerciseVideoView = RWVideoView()
    let controlsView = RWControlsView()
    
    let exerciseModel = ExerciseModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureExerciseView()
        configureCountDownLabel()
        configureTitleExerciseLabel()
        configureDescriptionExerciseLabel()
        configureControlsView()        
        showNewExercise()
    }
    
    @objc func showNewExercise() {
        let randomExercise = exerciseModel.getRandomExercise()
        titleExerciseLabel.text = randomExercise.name
        descriptionExerciseLabel.text = randomExercise.descripcion
        exerciseVideoView.prepareVideoLoop(name: randomExercise.videoFileName)
        exerciseVideoView.play()
    }
    
    @objc func playStopExercise() {
        if controlsView.isPlaying {
            controlsView.pause()
        } else {
            controlsView.play()
        }
    }
    
    @objc func doneExercise() {
        controlsView.reset()
    }
    
    func configureExerciseView() {
        view.addSubview(exerciseVideoView)
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
    
    func configureControlsView() {
        view.addSubview(controlsView)
        
        controlsView.nextButton.addTarget(self, action: #selector(showNewExercise), for: .touchUpInside)
        controlsView.startButton.addTarget(self, action: #selector(playStopExercise), for: .touchUpInside)
        controlsView.doneButton.addTarget(self, action: #selector(doneExercise), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            controlsView.heightAnchor.constraint(equalToConstant: 60),
            controlsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -40),
            controlsView.leadingAnchor.constraint(equalTo: exerciseVideoView.leadingAnchor),
            controlsView.trailingAnchor.constraint(equalTo: exerciseVideoView.trailingAnchor)
        ])
    }
    
}
