//
//  HomeVC.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 14/01/21.
//

import UIKit
import AVFoundation

class HomeVC: UIViewController {
    
    let exerciseVideo = RWVideoView()
    let titleExercise = RWTitleLabel(fontSize: 26, textAlignment: .center)
    let descriptionExercise = RWBodyLabel(textAlignment: .center, numberOfLines: 2)
    let controls = RWControlsView()
    let counter = RWCounterView()
    let infoWorkout = RWWorkoutInfoView()
    
    let exerciseModel = ExerciseModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = true
        configureExerciseView()
        configureTitleExerciseLabel()
        configureDescriptionExerciseLabel()
        configureInfoWorkout()
        configureControlsView()
        configureCounterView()
        configureTargetActions()
        showNewExercise()
    }
    
    func configureTargetActions() {
        controls.nextButton.addTarget(self, action: #selector(showNewExercise), for: .touchUpInside)
        controls.startButton.addTarget(self, action: #selector(playStopExercise), for: .touchUpInside)
        controls.doneButton.addTarget(self, action: #selector(doneExercise), for: .touchUpInside)
    }
    
    @objc func showNewExercise() {
        let randomExercise = exerciseModel.getRandomExercise()
        let randomReps = Int.random(in: randomExercise.workout.minReps...randomExercise.workout.maxReps)
        let durationSeconds =  randomExercise.workout.durationRep * randomReps
        
        titleExercise.text = randomExercise.name
        descriptionExercise.text = randomExercise.descripcion
        infoWorkout.setInfo(repetitions: randomReps, totalTime: durationSeconds)
        exerciseVideo.prepareVideoLoop(name: randomExercise.videoFileName)
        exerciseVideo.play()
    }
    
    @objc func playStopExercise() {
        // se pausa si esta ejecutandose de lo contrario se pone play/continua
        if controls.isPlaying {
            controls.pause()
            exerciseVideo.pause()
            counter.stopTimer()
        } else {
            controls.play()
            exerciseVideo.play()
            counter.startTimer()
        }
    }
    
    @objc func doneExercise() {
        controls.reset()
        counter.resetTimer()
    }
    
    func configureExerciseView() {
        view.addSubview(exerciseVideo)
        NSLayoutConstraint.activate([
            exerciseVideo.heightAnchor.constraint(equalToConstant: 320),
            exerciseVideo.widthAnchor.constraint(equalToConstant: 300),
            exerciseVideo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140),
            exerciseVideo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureTitleExerciseLabel() {
        view.addSubview(titleExercise)
        NSLayoutConstraint.activate([
            titleExercise.heightAnchor.constraint(equalToConstant: 30),
            titleExercise.leadingAnchor.constraint(equalTo: exerciseVideo.leadingAnchor),
            titleExercise.trailingAnchor.constraint(equalTo: exerciseVideo.trailingAnchor ),
            titleExercise.topAnchor.constraint(equalTo: exerciseVideo.bottomAnchor, constant: 5)
        ])
    }
    
    func configureDescriptionExerciseLabel() {
        view.addSubview(descriptionExercise)
        NSLayoutConstraint.activate([
            descriptionExercise.heightAnchor.constraint(equalToConstant: 60),
            descriptionExercise.topAnchor.constraint(equalTo: titleExercise.bottomAnchor),
            descriptionExercise.leadingAnchor.constraint(equalTo: titleExercise.leadingAnchor),
            descriptionExercise.trailingAnchor.constraint(equalTo: titleExercise.trailingAnchor)
        ])
    }
    
    func configureInfoWorkout() {
        view.addSubview(infoWorkout)
        NSLayoutConstraint.activate([
            infoWorkout.heightAnchor.constraint(equalToConstant: 40),
            infoWorkout.leadingAnchor.constraint(equalTo: exerciseVideo.leadingAnchor),
            infoWorkout.trailingAnchor.constraint(equalTo: exerciseVideo.trailingAnchor),
            infoWorkout.topAnchor.constraint(equalTo: descriptionExercise.bottomAnchor, constant: 0)
        ])
    }
    
    func configureControlsView() {
        view.addSubview(controls)
        NSLayoutConstraint.activate([
            controls.heightAnchor.constraint(equalToConstant: 60),
            controls.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -15),
            controls.leadingAnchor.constraint(equalTo: exerciseVideo.leadingAnchor),
            controls.trailingAnchor.constraint(equalTo: exerciseVideo.trailingAnchor)
        ])
    }
    
    func configureCounterView() {
        view.addSubview(counter)
        NSLayoutConstraint.activate([
            counter.heightAnchor.constraint(equalToConstant: 35),
            counter.widthAnchor.constraint(equalToConstant: 300),
            counter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counter.bottomAnchor.constraint(equalTo: controls.topAnchor, constant: -10)
        ])
    }
    
}
