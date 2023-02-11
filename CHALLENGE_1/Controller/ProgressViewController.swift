//
//  ProgressViewController.swift
//  CHALLENGE_1
//
//  Created by Artur Imanbaev on 05.02.2023.
//

import UIKit
final class ProgressViewController: UIViewController {
    private var question:CQuestions? = nil
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
    var progressCells: [UIImageView] = []
    
    convenience init(_ question: CQuestions) {
        self.init(nibName:nil, bundle:nil)
        self.question = question
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
        makeLabels()
        setupConstraints()
        self.view.addTapGesture(tapNumber: 1, target: self, action: #selector(toBackView))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if currentPosition > 0 {
            ( stack.arrangedSubviews[currentPosition] as! ProgressButton).setCorrectStatus()
            ( stack.arrangedSubviews[currentPosition - 1] as! ProgressButton).setSelectStatus()
        }
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

    private func checkLastQuestion(_ index: Int) -> String{
        if(index + 1 == 1){
            return ""
        } else {
            return "RUB"
        }
    }
    @objc func toBackView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setCurrentPosition(_ index: Int) {
        currentPosition = (question?.countQustion())! - index
        print(currentPosition)
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
