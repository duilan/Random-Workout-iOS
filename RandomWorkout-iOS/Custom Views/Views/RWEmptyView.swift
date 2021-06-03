//
//  RWEmptyView.swift
//  RandomWorkout-iOS
//
//  Created by Duilan on 02/06/21.
//

import UIKit

final class RWEmptyView: UIView {
    
    private let messageLabel = RWTitleLabel(fontSize: 20, textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(messageLabel)
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .systemGray        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
}

