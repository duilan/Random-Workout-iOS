//
//  RWControlsView.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 04/02/21.
//

import UIKit

final class RWControlsView: UIView {
    
    let startButton = RWButton(backgroundColor: .systemIndigo, title: "")
    let doneButton = RWButton(backgroundColor: .systemGreen, title: "Done")
    let nextButton = RWButton(backgroundColor: .systemOrange, title: "Next")
    private let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular, scale: .large)
    private let symbolPlay = UIImage(systemName: "play.fill")!
    private let symbolPause = UIImage(systemName: "pause.fill")!
    
    var isPlaying = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        configureDoneButton()
        configureNextButton()
        configureStartButton()
        doneButton.disable()
        nextButton.enable()
        
    }
    
    func play() {
        isPlaying = true
        startButton.setImage( symbolPause.withConfiguration(symbolConfig) , for: .normal)
        startButton.backgroundColor = .systemPink
        doneButton.disable()
        nextButton.disable()
    }
    
    func pause() {
        isPlaying = false
        startButton.setImage(symbolPlay.withConfiguration(symbolConfig) , for: .normal)
        startButton.backgroundColor = .systemIndigo
        doneButton.enable()
        nextButton.disable()
    }
    
    func reset() {
        isPlaying = false
        startButton.setImage(symbolPlay.withConfiguration(symbolConfig) , for: .normal)
        startButton.backgroundColor = .systemIndigo
        doneButton.disable()
        nextButton.enable()
    }
        
    @objc func hapticFeeback(){
        let haptic = UISelectionFeedbackGenerator()
        haptic.selectionChanged()
    }
    
    private func configureDoneButton() {
        addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.heightAnchor.constraint(equalToConstant: 40),
            doneButton.widthAnchor.constraint(equalToConstant: 80),
            doneButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            doneButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func configureStartButton() {
        addSubview(startButton)
        startButton.addTarget(self, action: #selector(hapticFeeback), for: .touchUpInside)
        startButton.setImage(symbolPlay.withConfiguration(symbolConfig) , for: .normal)
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.layer.borderWidth = 4
        startButton.clipsToBounds = true
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 70),
            startButton.widthAnchor.constraint(equalToConstant: 70),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func configureNextButton() {
        addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.widthAnchor.constraint(equalToConstant: 80),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nextButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height / 2
    }
    
}
