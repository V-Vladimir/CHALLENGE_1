//
//  ViewController.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 05.02.2023.
//

import UIKit
import RealmSwift

class FinalController: UIViewController {
    var delegate: FinalControllerDelegate?
    let finalView = FinalView()
    
    private lazy var playAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.2319103479, green: 0.7549440265, blue: 0.2910608053, alpha: 1)
        button.setTitle("PLAY AGAIN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.robotoMedium32()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    //load view from FinalView
    override func loadView() {
        view = finalView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(playAgainButton)
        setConstraints()
        delegate?.saveResults(controller: self)
        showResult(isWin: delegate!.isWin())
    }

    func showResult(isWin: Bool) {
        if isWin {
            finalView.textInformation.text =
            "Вы выйграли! вы ответили на все вопросы!"
            finalView.finalResultText.text = "WIN"
        } else if !isWin {
            finalView.textInformation.text = delegate?.showLostResult()
            finalView.finalResultText.text = "LOSE"
        }
    }
    //MARK: - Selectors
   
    @objc  func buttonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Set Constraints

extension FinalController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            playAgainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20),
            playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playAgainButton.widthAnchor.constraint(equalToConstant: 282),
            playAgainButton.heightAnchor.constraint(equalToConstant: 87),
        ])
    }
    
    
}

//MARK: - Delegate
protocol FinalControllerDelegate {
    func saveResults(controller: FinalController)
    
    func showLostResult()  -> String
    func isWin() -> Bool
func takeMoney() -> String
}
