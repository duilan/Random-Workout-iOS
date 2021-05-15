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
            timeFormated = "\(time)s"
        } else if minutes >= 1 && seconds == 0 {
            timeFormated = "\(minutes) min"
        } else {
            timeFormated = "\(minutes)m \(seconds)s"
        }
        return timeFormated
    }
    
    private func configure() {
        
        contentView.addSubview(imagen)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(yourTime)
        contentView.addSubview(hStack)
        
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.layer.cornerRadius = 8
        imagen.clipsToBounds = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        dateLabel.textColor = .secondaryLabel
        
        yourTime.backgroundColor = .secondarySystemBackground
        yourTime.layer.cornerRadius = 8
        imagen.clipsToBounds = true
        
        hStack.addArrangedSubview(reps)
        hStack.addArrangedSubview(time)
        
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.alignment = .fill
        hStack.distribution = .fillEqually
        hStack.spacing = 0
        
        NSLayoutConstraint.activate([
            imagen.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imagen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imagen.heightAnchor.constraint(equalToConstant: 70),
            imagen.widthAnchor.constraint(equalToConstant: 65),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: imagen.rightAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            dateLabel.leftAnchor.constraint(equalTo: imagen.rightAnchor, constant: 10),
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            yourTime.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            yourTime.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            yourTime.bottomAnchor.constraint(equalTo: dateLabel.topAnchor),
            yourTime.widthAnchor.constraint(equalToConstant: 80),
            
            hStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            hStack.leftAnchor.constraint(equalTo: imagen.rightAnchor, constant: 10),
            hStack.rightAnchor.constraint(equalTo: yourTime.leftAnchor, constant: 0),
            hStack.bottomAnchor.constraint(equalTo: dateLabel.topAnchor)
        ])
        
    }
    
}
