//
//  NSAttributedString + Extensions.swift
//  CHALLENGE_1
//
//  Created by Aleksandr Kan on 05/02/23.
//

import UIKit

extension String {
    
    static func getSpecialString(text: String) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: [
            .font: UIFont.robotoMedium24() ?? UIFont.systemFont(ofSize: 24),
            .foregroundColor: UIColor.specialGreenColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ])
    }
    
}
