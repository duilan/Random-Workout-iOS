//
//  RWWorkOutDetailView.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 23/02/21.
//

import UIKit

class RWWorkoutInfoView: UIView {
    
    let repetitionValue = RWTitleLabel(fontSize: 16, textAlignment: .center)
    let totalTimeValue = RWTitleLabel(fontSize: 16, textAlignment: .center)
    
    let repetitionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.text = "Repetitions"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.text = "Total time"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hstack: UIStackView = {
        let stack  = UIStackView()
        stack.axis  = .horizontal
        stack.alignment = .center
        stack.distribution  = .fillEqually
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let vstackRepetition: UIStackView = {
        let stack  = UIStackView()
        stack.axis  = .vertical
        stack.alignment = .center
        stack.distribution  = .equalCentering
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let vstackTime: UIStackView = {
        let stack  = UIStackView()
        stack.axis  = .vertical
        stack.alignment = .center
        stack.distribution  = .equalCentering
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configureStacks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInfo(with workout: Workout ) {
        repetitionValue.text = String(workout.repetitions)
        
        let minutes = workout.time / 60
        let seconds = workout.time % 60
        
        if minutes < 1 {
            totalTimeValue.text = "\(workout.time) sec"
        } else if minutes >= 1 && seconds == 0 {
            totalTimeValue.text = "\(minutes) min"
        } else {
            totalTimeValue.text = "\(minutes) min \(seconds) sec"
        }
    }
    
    func configureStacks() {
        addSubview(hstack)
        
        vstackRepetition.addArrangedSubview(repetitionValue)
        vstackRepetition.addArrangedSubview(repetitionLabel)
        vstackTime.addArrangedSubview(totalTimeValue)
        vstackTime.addArrangedSubview(totalTimeLabel)
        
        hstack.addArrangedSubview(vstackRepetition)
        hstack.addArrangedSubview(vstackTime)
        
        NSLayoutConstraint.activate([
            hstack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hstack.trailingAnchor.constraint(equalTo: trailingAnchor),
            hstack.topAnchor.constraint(equalTo: topAnchor),
            hstack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}
