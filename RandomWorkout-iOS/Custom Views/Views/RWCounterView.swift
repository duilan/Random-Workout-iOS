//
//  RWCounterView.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 13/02/21.
//

import UIKit
import AVFoundation

protocol CounterViewDelegate {
    func counterCompleted()
}

final class RWCounterView: UIView {
    
    private let timelabel = UILabel()
    private let audioPlayer = AudioPlayer()
    private var timer: Timer?
    
    var timeRemaining = 0
    var timeCounted = 0
    
    var delegate: CounterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTimer(seconds: Int) {
        self.timeRemaining = seconds
    }
    
    func startTimer() {
        updateTimeLabel()
        stopTimer()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        audioPlayer.playSound(fileName: "play")
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func resetTimer() {
        stopTimer()
        timeRemaining = 0
        timeCounted = 0
        updateTimeLabel()
    }
    
    private func updateTimeLabel(){
        self.timelabel.text = self.timeFormatted(totalSeconds: self.timeRemaining)
    }
    
    @objc private func updateTimer() {
        timeRemaining -= 1
        timeCounted += 1
        updateTimeLabel()
        if timeRemaining == 0 {
            audioPlayer.playSound(fileName: "complete")
            delegate?.counterCompleted()
        }
    }
    
    private func timeFormatted(totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        timelabel.text = "00:00"
        timelabel.textColor = .label        
        timelabel.adjustsFontSizeToFitWidth = true
        timelabel.font = UIFont.systemFont(ofSize: 35, weight: .thin)
        timelabel.textAlignment = .center
        timelabel.minimumScaleFactor = 0.8
        timelabel.lineBreakMode = .byTruncatingTail
        timelabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timelabel)
        
        NSLayoutConstraint.activate([
            timelabel.topAnchor.constraint(equalTo: topAnchor),
            timelabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            timelabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            timelabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
}
