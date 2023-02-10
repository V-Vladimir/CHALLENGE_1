//
//  ProgressCell.swift
//  CHALLENGE_1
//
//  Created by Artur Imanbaev on 09.02.2023.
//

import Foundation
import UIKit

class ProgressCell: UIImageView {
    private var questionCell = UIImageView()
    let amountsOfWin = ["100","200","300","500","1000"
                        ,"2000","4000","8000","16000","32000"
                        ,"64000","125000","250000","500000"
                        ,"1 Миллион"]
    func setProgressCell(_ cell: String){
        let width = UIScreen.main.bounds.size.width
        questionCell.image = UIImage(named: cell)
        questionCell.contentMode = .scaleToFill
        questionCell.translatesAutoresizingMaskIntoConstraints = false
        questionCell.widthAnchor.constraint(equalToConstant: width * (1 - CGFloat(5) * 0.035)).isActive = true
    }
    func getProgressCell() -> UIImageView{
        return questionCell
    }
    func setGreenImage(_ cell: String){
        questionCell.image = UIImage(named: "Rectangle green")
    }

    
}
