//
//  HistoryCell.swift
//  RandomWorkout-iOS
//
//  Created by Duilan on 26/04/21.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    static let reuseID = "HistoryCell"
    private let titleLabel = RWTitleLabel(fontSize: 14, textAlignment: .left)
    private let imagen = UIImageView()
    private let dateLabel = UILabel()
    private let hStack = UIStackView()
    
    let reps = RWItemInfoView(style: .small)
    let time = RWItemInfoView(style: .small)
    let yourTime = RWItemInfoView(style: .big, valueColor: .systemOrange)
    
    private let dateFormat: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "d MMM yyyy HH:mm"
        return f
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with historyItem: History) {
        imagen.image = UIImage(named: historyItem.id ?? "drink_water")
        titleLabel.text = historyItem.name
        
        reps.titleLabel.text = "Reps"
        reps.valueLabel.text = String(historyItem.repetitions)
        
        time.titleLabel.text = "Time"
        time.valueLabel.text = formatTimeToString(seconds: Int(historyItem.time))
        
        yourTime.titleLabel.text = "Your Time"
        yourTime.valueLabel.text = formatTimeToString(seconds: Int(historyItem.counterTime))
        
        dateLabel.text = dateFormat.string(from: historyItem.date!)
        
    }
    
    func formatTimeToString(seconds time: Int) -> String {
        
        let minutes = time / 60
        let seconds = time % 60
        var timeFormated: String
        
        if minutes < 1 {
            timeFormated = "\(time) sec"
        } else if minutes >= 1 && seconds == 0 {
            timeFormated = "\(minutes) min"
        } else {
            timeFormated = "\(minutes) min \(seconds) sec"
        }
        return timeFormated
    }
    
    private func configure() {
        
        contentView.addSubview(imagen)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(hStack)
        
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.layer.cornerRadius = 8
        imagen.clipsToBounds = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        dateLabel.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            imagen.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imagen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imagen.heightAnchor.constraint(equalToConstant: 70),
            imagen.widthAnchor.constraint(equalToConstant: 65),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: imagen.rightAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            dateLabel.leftAnchor.constraint(equalTo: imagen.rightAnchor, constant: 10),
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
        
        hStack.axis = .horizontal
        hStack.alignment = .fill
        hStack.distribution = .fillEqually
        hStack.spacing = 0
        
        hStack.addArrangedSubview(reps)
        hStack.addArrangedSubview(time)
        hStack.addArrangedSubview(yourTime)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10),
            hStack.leftAnchor.constraint(equalTo: imagen.rightAnchor, constant: 10),
            hStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),            
            hStack.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -10)
        ])
        
    }
    
}
