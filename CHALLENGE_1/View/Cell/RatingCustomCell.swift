//
//  RatingCustomCell.swift
//  CHALLENGE_1
//
//  Created by Aleksandr Kan on 10/02/23.
//

import UIKit

class RatingCustomCell: UITableViewCell {
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Имя: Best Player"
        label.font = .robotoMedium18()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let levelLabel: UILabel = {
       let label = UILabel()
        label.text = "Вопрос: 23"
        label.font = .robotoBold16()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let datelabel: UILabel = {
       let label = UILabel()
        label.text = "Дата: 12.02.2023"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stackViews = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        stackViews = UIStackView(arrangedSubviews: [nameLabel, levelLabel], axis: .horizontal, spacing: 10)
        addSubview(stackViews)
        addSubview(datelabel)
    }
    
    func setupInfo(for player: PlayerModel) {
        nameLabel.text = "Имя: \(player.playerName)"
        levelLabel.text = "Вопрос: \(player.levelQuestion)"
        datelabel.text = "Дата \(player.date)"
    }
   
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackViews.topAnchor.constraint(equalTo: topAnchor),
            stackViews.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViews.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViews.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            //datelabel.topAnchor.constraint(equalTo: stackViews.bottomAnchor, constant: 10),
            datelabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            datelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }

}
