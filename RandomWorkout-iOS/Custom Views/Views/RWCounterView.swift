//
//  RWCounterView.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 13/02/21.
//

import UIKit

final class RWCounterView: UIView {
    
    private let timelabel = UILabel()
    private var timer: Timer?
    var totalTime = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func getTimeString() -> String {
        return timeFormatted(totalSeconds: totalTime)
    }
    
    func resetTimer() {
        stopTimer()
        totalTime = 0
        timelabel.text = "00:00"
    }
    
    @objc func updateTimeLabel() {
        totalTime += 1
        timelabel.text = timeFormatted(totalSeconds: totalTime)
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
