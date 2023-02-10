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
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}
