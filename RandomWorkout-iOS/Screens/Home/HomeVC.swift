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
    
    var timer: Timer?
    var totalTime = 0
    
    let exerciseModel = ExerciseModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureExerciseView()
        configureTitleExerciseLabel()
        configureDescriptionExerciseLabel()
        configureControlsView()
        configureCountDownLabel()
        showNewExercise()
    }
    
    @objc func showNewExercise() {
        let randomExercise = exerciseModel.getRandomExercise()
        titleExerciseLabel.text = randomExercise.name
        descriptionExerciseLabel.text = randomExercise.descripcion
        exerciseVideoView.prepareVideoLoop(name: randomExercise.videoFileName)
        exerciseVideoView.play()
        resetTimer()
    }
    
    @objc func playStopExercise() {
        if controlsView.isPlaying {
            // se pausa si esta ejecutandose
            controlsView.pause()
            stopTimer()
        } else {
            // se pone play/continua
            controlsView.play()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountDownLabel), userInfo: nil, repeats: true)
        }
    }
    
    @objc func doneExercise() {
        controlsView.reset()
        resetTimer()
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    @objc func resetTimer() {
        timer?.invalidate()
        totalTime = 0
        countDownLabel.text = "00:00"
    }
    
    @objc func updateCountDownLabel(){
        totalTime += 1
        countDownLabel.text = timeFormatted(totalSeconds: totalTime)
        
    }
    
    private func timeFormatted(totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func configureExerciseView() {
        view.addSubview(exerciseVideoView)
        NSLayoutConstraint.activate([
            exerciseVideoView.heightAnchor.constraint(equalToConstant: 320),
            exerciseVideoView.widthAnchor.constraint(equalToConstant: 300),
            exerciseVideoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130),
            exerciseVideoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureCountDownLabel() {
        view.addSubview(countDownLabel)
        countDownLabel.text = "00:00"
        countDownLabel.font = UIFont.systemFont(ofSize: 35, weight: .thin)
        countDownLabel.clipsToBounds = true        
        NSLayoutConstraint.activate([
            countDownLabel.heightAnchor.constraint(equalToConstant: 35),
            countDownLabel.widthAnchor.constraint(equalToConstant: 105),
            countDownLabel.bottomAnchor.constraint(equalTo: controlsView.topAnchor, constant: -20),
            countDownLabel.centerXAnchor.constraint(equalTo: controlsView.centerXAnchor)
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
