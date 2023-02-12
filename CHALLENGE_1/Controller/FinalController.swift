//
//  ViewController.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 05.02.2023.
//

import UIKit
import RealmSwift

class FinalController: UIViewController {
    private let localRealm = try! Realm()
    private var playerModel = PlayerModel()
    
    private var question:CQuestions? = nil
    var delegate: FinalControllerDelegate?
    let finalView = FinalView()
    var winSubText = ""
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
    
    convenience init(_ question: CQuestions) {
        self.init(nibName:nil, bundle:nil)
        self.question = question
    }
    
    //load view from FinalView
    override func loadView() {
        view = finalView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(playAgainButton)
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showResult()
    }

    func showResult() {
        saveResults()
        if question!.winPosition == question!.countQustion() {
            finalView.textInformation.text = "\(question!.playerName) Вы победитель."
        } else
        if (question!.winPosition == 0) {
            finalView.textInformation.text = showLostResult()
        } else {
            finalView.textInformation.text = takeMoney()
        }
        finalView.finalResultText.text =  question!.getWinSumm()
    }
    
    func showLostResult() -> String {
        return "\(question!.playerName).Вы проиграли на \(question!.getPosition()) вопросе";
    }
    
    func takeMoney() -> String {
        return "\(question!.playerName) Вы забрали деньги на \(question!.getPosition())."
    }

    
    func setWinText(_ text:String) {
        winSubText = text
    }
    
    //MARK: - Selectors
   
    @objc  func buttonTapped() {
        self.navigationController?.pushViewController(WelocmeViewController(), animated: true)
    }
    
    //MARK: - Setup for Realm
    private func createModel() {
        playerModel.playerName = question!.player.name
        playerModel.levelQuestion = question!.player.questionLevel
        playerModel.date = question!.player.date
    }
    
    private func saveModel() {
        RealmManager.shared.savePlayerModel(playerModel)
        playerModel = PlayerModel()
        resetPlayerModel()
    }
    
    private func resetPlayerModel() {
        question!.player.reset()
    }
    
    func saveResults() {
        createModel()
        saveModel()
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
}
