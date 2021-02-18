//
//  RWBodyLabel.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 26/01/21.
//

import UIKit

class RWBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, numberOfLines: Int) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        configure()
    }
    
    private func configure() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
