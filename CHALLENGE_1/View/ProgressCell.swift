//
//  ProgressCell.swift
//  CHALLENGE_1
//
//  Created by Artur Imanbaev on 09.02.2023.
//

import Foundation
import UIKit

class ProgressCell: UIImageView {
    private var nameOffImage: String = ""
    private var nameOnImage: String = ""
    private var imageView = UIImageView()
    let amountsOfWin = ["100","200","300","500","1000"
                        ,"2000","4000","8000","16000","32000"
                        ,"64000","125000","250000","500000"
                        ,"1 Миллион"]
    private func setImageView(_ index: Int){
        let image = UIImage(named: nameOnImage)
        let questionCell = UIImageView()
        let width = UIScreen.main.bounds.size.width
        questionCell.image = UIImage(named: checkColorOfRectangle(index))
        questionCell.contentMode = .scaleToFill
        questionCell.translatesAutoresizingMaskIntoConstraints = false
        questionCell.widthAnchor.constraint(equalToConstant: width * (1 - CGFloat(5) * 0.035)).isActive = true
        
        //create label and subView it on question cell
        let labelTextNumberOfQuestion = UILabel()
        labelTextNumberOfQuestion.text = "Вопрос \(amountsOfWin.count - index)"
        labelTextNumberOfQuestion.textColor = .white
        labelTextNumberOfQuestion.font = .systemFont(ofSize: 20)
        labelTextNumberOfQuestion.numberOfLines = 0
        labelTextNumberOfQuestion.translatesAutoresizingMaskIntoConstraints = false
        
        let labelAmountOfMoney = UILabel()
        labelAmountOfMoney.text = "\(amountsOfWin[amountsOfWin.count - index - 1]) \(checkLastQuestion(index))"
        labelAmountOfMoney.textColor = .white
        labelAmountOfMoney.font = .systemFont(ofSize: 20)
        labelAmountOfMoney.numberOfLines = 0
        labelAmountOfMoney.translatesAutoresizingMaskIntoConstraints = false
    }
    func checkColorOfRectangle(_ index: Int) -> String{
        let position = amountsOfWin.count - index
        if(position == 5) || (position == 10){
            return "Rectangle blue"
        }
        else if (position == 15){
            return "Rectangle yellow"
        }
//        else if (position == currentPosition){
//            return "Rectangle green"
//        }
        else{
            return "Rectangle violet"
        }
    }
    func checkLastQuestion(_ index: Int) -> String{
        if(index + 1 == 1){
            return ""
        } else {
            return "RUB"
        }
    }
}
