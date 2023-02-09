//
//  AnswerButton.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 06.02.2023.
//

import UIKit

final class AnswerButton : UIButton {
    let gradient = CAGradientLayer()
    let textAnswer: UILabel = {
        $0.contentMode = .scaleAspectFit
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    let labelTag: UILabel = {
        $0.contentMode = .scaleAspectFit
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    convenience init(frame:CGRect, text:String) {
        self.init(frame: frame)
    }
    
    convenience init(_ tag:Int, _ text:String) {
        self.init()
        self.tag = tag
        let charVal = String("A").unicodeScalars
        let asciiVal = Int(charVal[charVal.startIndex].value)
        self.labelTag.text = "\(Character(UnicodeScalar(asciiVal + tag)!))"
        self.addSubview(labelTag)
        self.addSubview(textAnswer)
        setDefaultStatus()
    }
    
    func setText(_ text:String) {
        self.textAnswer.text = text
        if text.isEmpty {
            setEmptyStatus()
        } else {
            setDefaultStatus()
            self.isEnabled = true
        }
    }
    
    func setGradientCollor(_ colorTop:UIColor, _ bottomColor:UIColor) {
        gradient.colors = [colorTop.cgColor, bottomColor.cgColor, colorTop.cgColor]
    }
    
    //MARK: Функция Градиента
    func applyGradients() {
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.cornerRadius = 16
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
        
    }
    //-MARK: неоюходим для получения градиента после инициализации NSLayotConstranes
    override func layoutSubviews() {
        super.layoutSubviews()
        labelTag.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        labelTag.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        textAnswer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        textAnswer.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.applyGradients()
    }
    func setDefaultStatus() {
        setGradientCollor(#colorLiteral(red: 0.199926585, green: 0.3648718894, blue: 0.4936357737, alpha: 1), #colorLiteral(red: 0.1125075445, green: 0.2618700266, blue: 0.281789422, alpha: 1))
    }
    
    func setMistakeStatus() {
        setGradientCollor(.red, #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1))
        self.isEnabled = false
    }

    func setEmptyStatus() {
        setGradientCollor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        self.isEnabled = false
    }
}


