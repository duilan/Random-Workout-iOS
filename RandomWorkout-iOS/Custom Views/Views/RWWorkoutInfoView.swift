//
//  RWWorkOutDetailView.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 23/02/21.
//

import UIKit

class RWWorkoutInfoView: UIView {
    private let repetitionInfo = RWItemInfoView(style: .normal)
    private let totalTimeInfo = RWItemInfoView(style: .normal)
    private let hstack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInfo(with workout: Workout ) {
        repetitionInfo.valueLabel.text = String(workout.repetitions)
        repetitionInfo.titleLabel.text = "Repetitions"
        totalTimeInfo.titleLabel.text = "Total time"
        
        let minutes = workout.time / 60
        let seconds = workout.time % 60
        
        if minutes < 1 {
            totalTimeInfo.valueLabel.text = "\(workout.time) sec"
        } else if minutes >= 1 && seconds == 0 {
            totalTimeInfo.valueLabel.text = "\(minutes) min"
        } else {
            totalTimeInfo.valueLabel.text = "\(minutes) min \(seconds) sec"
        }
    }
    
    private func configureLayout() {
        addSubview(hstack)
        hstack.addArrangedSubview(repetitionInfo)
        hstack.addArrangedSubview(totalTimeInfo)
        
        hstack.axis  = .horizontal
        hstack.alignment = .center
        hstack.distribution  = .fillEqually
        hstack.spacing = 0
        hstack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hstack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hstack.trailingAnchor.constraint(equalTo: trailingAnchor),
            hstack.topAnchor.constraint(equalTo: topAnchor),
            hstack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}
