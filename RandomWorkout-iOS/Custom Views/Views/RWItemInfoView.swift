//
//  RWItemInfoView.swift
//  RandomWorkout-iOS
//
//  Created by Duilan on 09/05/21.
//

import UIKit

enum ItemInfoStyle {
    case normal
    case big
    case small
}

class RWItemInfoView: UIView {
    
    let valueLabel = UILabel()
    let titleLabel = UILabel()
    
    init(style: ItemInfoStyle ) {
        super.init(frame: .zero)
        configure()
        
        switch style {
        case .normal:
            configureStyleNormal()
        case .small:
            configureStyleSmall()
        case .big:
            configureStyleBig()
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureStyleNormal() {
        titleLabel.font = .systemFont(ofSize: 12, weight: .bold)
        valueLabel.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    func configureStyleSmall() {
        titleLabel.font = .systemFont(ofSize: 12, weight: .bold)
        valueLabel.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    func configureStyleBig() {
        titleLabel.font = .systemFont(ofSize: 12, weight: .bold)
        valueLabel.font = .systemFont(ofSize: 18, weight: .bold)
        valueLabel.textColor = .systemOrange
    }
    
    func configure() {
        addSubview(titleLabel)
        addSubview(valueLabel)
        
        titleLabel.textColor = .secondaryLabel
        titleLabel.textAlignment = .center
        valueLabel.textAlignment = .center
        valueLabel.textColor = .label
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.minimumScaleFactor = 0.8
        valueLabel.lineBreakMode = .byTruncatingTail
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -8),
            valueLabel.leftAnchor.constraint(equalTo: leftAnchor),
            valueLabel.rightAnchor.constraint(equalTo: rightAnchor),
            titleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
