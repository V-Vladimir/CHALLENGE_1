//
//  ViewController.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 05.02.2023.
//

import UIKit

class FinalController: UIViewController {
    var questionsModel = CQuestions()
    let finalView = FinalView()
    
    let playAgainButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.2319103479, green: 0.7549440265, blue: 0.2910608053, alpha: 1)
        button.setTitle("PlAY AGAIN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialMT", size: 36)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        view = finalView
        // if you'd like to  change titles
        
        //finalView.textInformation.text = "you're score is 12 "
        //finalView.finalResultText.text = "LOSE"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(playAgainButton)
    setConstraints()

    }

    @objc  func buttonTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        //code for segue
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            playAgainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20),
            playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playAgainButton.widthAnchor.constraint(equalToConstant: 282),
            playAgainButton.heightAnchor.constraint(equalToConstant: 87),
        ])
    }
}

