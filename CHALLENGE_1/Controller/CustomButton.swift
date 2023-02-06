//
//  GradientsColors.swift
//  CHALLENGE_1
//
//  Created by Meddor on 05.02.2023.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
            
        translatesAutoresizingMaskIntoConstraints = false
        setTitle("ButtonC", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 25)
        tintColor = .white
        layer.cornerRadius = 16
        
    }
    

    
}
