//
//  ViewController.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 05.02.2023.
//

import UIKit

class ViewController: UIViewController {
    var questionsModel = CQuestions()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .green
    }
    
}


//MARK: - Set Constraints
extension ViewController {
    
    private func setConstraints() {
        
    }
    
}
