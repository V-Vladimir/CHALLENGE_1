//
//  GradientsColors.swift
//  CHALLENGE_1
//
//  Created by Meddor on 05.02.2023.
//

import UIKit

class GradientsColors {
    func applyGradients(color: CGColor) {
        let gradient = CAGradientLayer()
        let colorTop = #colorLiteral(red: 0.199926585, green: 0.3648718894, blue: 0.4936357737, alpha: 1).cgColor
        let bottomColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor
        
        gradient.colors = [colorTop,bottomColor]
        gradient.locations = [0,1]
        gradient.frame = gradient.bounds
        
    }
}
