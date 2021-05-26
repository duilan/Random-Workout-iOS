//
//  RWItemInfoView.swift
//  RandomWorkout-iOS
//
//  Created by Duilan on 09/05/21.
//

import UIKit

final class RWItemInfoView: UIView {
    let valueLabel = UILabel()
    let titleLabel = UILabel()
    private var styleInfo: ItemInfoStyle = .normal
    private var valueTextColor: UIColor = .label
    
    enum ItemInfoStyle {
        case small
        case normal
        case big
    }
    
    init(style: ItemInfoStyle, valueColor: UIColor = .label ) {
        super.init(frame: .zero)
        styleInfo = style
        valueTextColor = valueColor
        
        configureUI()
        configureLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        valueLabel.textColor = valueTextColor
        valueLabel.textAlignment = .center
        valueLabel.minimumScaleFactor = 0.8
        
        titleLabel.textColor = .secondaryLabel
        titleLabel.textAlignment = .center
        
        switch styleInfo {
        case .small:
            valueLabel.font = .systemFont(ofSize: 12, weight: .regular)
            titleLabel.font = .systemFont(ofSize: 10, weight: .semibold)
        case .normal:
            valueLabel.font = .systemFont(ofSize: 16, weight: .bold)
            titleLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        case .big:
            valueLabel.font = .systemFont(ofSize: 16, weight: .heavy)
            titleLabel.font = .systemFont(ofSize: 12, weight: .bold)
        }
    }   
    
    private func configureLayout() {
        addSubview(valueLabel)
        addSubview(titleLabel)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
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
