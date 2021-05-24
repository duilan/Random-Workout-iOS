//
//  ExerciseCell.swift
//  RandomWorkout-iOS
//
//  Created by Duilan on 23/05/21.
//

import UIKit

class ExerciseCell: UICollectionViewCell {
    static let reuseID = "ExerciseCell"
    let exerciseImage = UIImageView()
    let titleLabel = RWTitleLabel(fontSize: 12, textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with exercise: Exercise) {
        exerciseImage.image = UIImage(named: exercise.videoFileName)
        titleLabel.text = exercise.name
    }
    
    private func configure() {
        contentView.addSubview(exerciseImage)
        contentView.addSubview(titleLabel)
        translatesAutoresizingMaskIntoConstraints = false
        
        exerciseImage.layer.cornerRadius = 8
        exerciseImage.clipsToBounds = true
        exerciseImage.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            exerciseImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            exerciseImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            exerciseImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            exerciseImage.heightAnchor.constraint(equalTo: exerciseImage.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: exerciseImage.bottomAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
