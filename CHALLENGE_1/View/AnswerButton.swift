//
//  AnswerButton.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 06.02.2023.
//

import Foundation
import UIKit

class AnswerButton : UIButton {
    private var backColor:UIColor!
    
    convenience init(frame:CGRect, text:String) {
        self.init(frame: frame)
    }
    convenience init(_ tag:Int, _ text:String) {
        self.init()
        self.tag = tag
        self.setTitle(text, for: .normal)
    }
    func setBackColor(_ color:UIColor) {
        self.backColor = color
    }
    func setText(_ text:String) {
        self.setTitle(text, for: .normal)
    }
    
    //MARK: Функция Градиента
    func applyGradients() {
        let gradient = CAGradientLayer()
        let colorTop = #colorLiteral(red: 0.199926585, green: 0.3648718894, blue: 0.4936357737, alpha: 1).cgColor
        let bottomColor = #colorLiteral(red: 0.1125075445, green: 0.2618700266, blue: 0.281789422, alpha: 1).cgColor

        gradient.colors = [colorTop,bottomColor,colorTop]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.cornerRadius = 16
        gradient.frame = self.bounds
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}


