//
//  UIViewController + Extensions.swift
//  CHALLENGE_1
//
//  Created by Aleksandr Kan on 10/02/23.
//

import UIKit

extension UIViewController {
    
    //Custom alert
    func alertOk(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    
}
