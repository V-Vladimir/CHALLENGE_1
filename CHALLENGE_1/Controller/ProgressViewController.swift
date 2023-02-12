//
//  ProgressViewController.swift
//  CHALLENGE_1
//
//  Created by Artur Imanbaev on 05.02.2023.
//

import UIKit
final class ProgressViewController: UIViewController {
    private var question:CQuestions? = nil
    private var finalVC:FinalController?
    let stack: UIStackView = {
        $0.axis = .vertical
        //$0.alignment = .center
        $0.distribution = .fillEqually
        $0.spacing = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    let imageIcon: UIImageView = {
        $0.image = UIImage(named: "mainImage")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    var currentPosition = 0
    var playerLost = false
    
    convenience init(_ question: CQuestions) {
        self.init(nibName:nil, bundle:nil)
        self.question = question
        finalVC = FinalController(question)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
        makeLabels()
        setupConstraints()
        for item in 0..<(question?.countQustion())! {
            (stack.arrangedSubviews[item] as! ProgressButton).addTarget(self, action: #selector(changeToLastVC), for: .touchUpInside)
        }
        //self.view.addTapGesture(tapNumber: 1, target: self, action: #selector(toBackView))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if currentPosition <= 0 {
            return
        }
        let buttonPast = ( stack.arrangedSubviews[currentPosition] as! ProgressButton)
        let buttonPresent = ( stack.arrangedSubviews[currentPosition - 1] as! ProgressButton)
        if(playerLost){
            buttonPresent.setMistakeStatus()
            self.view.addTapGesture(tapNumber: 1, target: self, action: #selector(toBackView))
        }
        else{
            if currentPosition > 0 {
                buttonPast.setCorrectStatus()
                buttonPast.labelMoneyOrNext.text = "Money"
                buttonPresent.setSelectStatus()
                buttonPresent.labelMoneyOrNext.text = "Next"
            }
            if(currentPosition == 11){ ( stack.arrangedSubviews[currentPosition - 1] as! ProgressButton).setSelectStatus()}
            else if (currentPosition == 6){ ( stack.arrangedSubviews[currentPosition - 1] as! ProgressButton).setSelectStatus()}
            else {
                for item in question!.checkPointPosition {
                    ( stack.arrangedSubviews[item] as! ProgressButton).setMistakeStatus()
                }
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if currentPosition <= 0 {
            return
        }
        let buttonPast = ( stack.arrangedSubviews[currentPosition] as! ProgressButton)
        let buttonPresent = ( stack.arrangedSubviews[currentPosition - 1] as! ProgressButton)
        buttonPast.labelMoneyOrNext.text = ""
        buttonPresent.labelMoneyOrNext.text = ""
    }
    private func makeLabels(){
        for i in 0..<(question?.countQustion())! {
            let index = (question?.countQustion())! - i
            let button = ProgressButton(i, (question?.getSumQuestionText(index - 1))!, "Вопрос \(index)")
            stack.addArrangedSubview(button)
        }
        for item in question!.checkPointPosition {
            ( stack.arrangedSubviews[item] as! ProgressButton).setMistakeStatus()
        }
        (stack.arrangedSubviews.first as! ProgressButton).setSelectStatus()
    }
    @objc func toBackView() {
        self.navigationController?.pushViewController(finalVC!, animated: true)
        
    }
    @objc func changeToLastVC(_ sender: ProgressButton){
        if question!.isFinish {
            self.navigationController?.pushViewController(finalVC!, animated: true)
            return
        }
        if sender.labelMoneyOrNext.text == "Money" {
            question!.winPosition = (question?.countQustion())! - currentPosition
            self.navigationController?.pushViewController(finalVC!, animated: true) // need to rename finalVC to finalWinVC
            print("Выбрал забрать деньги")
            return
        }
        if sender.labelMoneyOrNext.text == "Next" {
            self.navigationController?.popViewController(animated: true)
            print("перешел на след вопрос")
            return
        }
        self.navigationController?.popViewController(animated: true)
//        if sender.tag == currentPosition - 1 {
//
//        }
//        if((sender.tag == question!.checkPointPosition[1])) && (currentPosition < 10 ){
//            self.navigationController?.pushViewController(finalVC!, animated: true)
//            print("Выбрал несгораемую 1000 сумму")
//        }
//        else if((sender.tag == question!.checkPointPosition[1])) && (currentPosition < 5 ){
//            self.navigationController?.pushViewController(finalVC!, animated: true)
//            print("выбрал 32000 сумму")
//        }
    }
  
    
    func setCurrentPosition(_ index: Int) {
        currentPosition = (question?.countQustion())! - index
    }
    func setLostPosition(_ index: Int) {
        currentPosition = (question?.countQustion())! - index
        playerLost = true
    }
    
}

extension ProgressViewController{
    private func setupConstraints(){
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 10),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        view.addSubview(imageIcon)
        NSLayoutConstraint.activate([
            imageIcon.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            imageIcon.bottomAnchor.constraint(equalTo: stack.safeAreaLayoutGuide.topAnchor),
            imageIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
