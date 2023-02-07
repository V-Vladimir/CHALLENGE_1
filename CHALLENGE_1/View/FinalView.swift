//
//  RestartView.swift
//  CHALLENGE_1
//
//  Created by Sergey Azimov on 05.02.2023.
//

import UIKit

class FinalView: UIView {

    let backgroundImage:UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "backgroundImage")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    let titleImage: UIImageView = {
       let titleImage = UIImageView()
        titleImage.image = UIImage(named: "mainImage")
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        return titleImage
    }()
    
    let textInformation: UILabel = {
       let textLabel = UILabel()
        textLabel.text = "You losed on {attempt} attempt"
        textLabel.textColor = .white
        textLabel.font = UIFont.robotoMedium24()
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.adjustsFontSizeToFitWidth = true
        return textLabel
    }()
    
    let finalResultText: UILabel = {
       let textLabel = UILabel()
        textLabel.text = "LOSE"
        textLabel.textColor = .red
        textLabel.font = UIFont.syneRegular60()
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(backgroundImage)
        addSubview(titleImage)
        addSubview(textInformation)
        addSubview(finalResultText)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 19),
            titleImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleImage.widthAnchor.constraint(equalToConstant: 201),
            titleImage.heightAnchor.constraint(equalToConstant: 201),
            
            textInformation.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 5),
            textInformation.centerXAnchor.constraint(equalTo: centerXAnchor),
            textInformation.widthAnchor.constraint(equalToConstant: 345),
            textInformation.heightAnchor.constraint(equalToConstant: 42),
            
            finalResultText.topAnchor.constraint(equalTo: textInformation.bottomAnchor, constant: 10),
            finalResultText.centerXAnchor.constraint(equalTo: centerXAnchor),
            finalResultText.widthAnchor.constraint(equalToConstant: 282),
            finalResultText.heightAnchor.constraint(equalToConstant: 60 ),
        ])
    }
}

