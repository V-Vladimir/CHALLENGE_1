//
//  GiveMyMoneyButton.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 09.02.2023.
//

import UIKit

final class GiveMyMoneyButton: UIButton {
    let gradient = CAGradientLayer()
    convenience init(frame:CGRect, text:String) {
        self.init(frame: frame)
    }
    
    convenience init(_ text:String) {
        self.init()
        self.setText(text)
        setDefaultStatus()
    }
    func setText(_ text:String) {
        self.setTitle(text, for: .normal)
        //self.textAnswer.text = text
    }
    
    //MARK: Функция Градиента
    func applyGradients() {
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.cornerRadius = 14
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    //-MARK: неоюходим для получения градиента после инициализации NSLayotConstranes
    override func layoutSubviews() {
        super.layoutSubviews()
        self.applyGradients()
    }
//
    func setGradientCollor(_ colorTop:UIColor, _ bottomColor:UIColor) {
        gradient.colors = [colorTop.cgColor, bottomColor.cgColor, colorTop.cgColor]
    }
    
    func setDefaultStatus() {
        setGradientCollor(#colorLiteral(red: 0.199926585, green: 0.3648718894, blue: 0.4936357737, alpha: 1), #colorLiteral(red: 0.1125075445, green: 0.2618700266, blue: 0.281789422, alpha: 1))
    }
}
