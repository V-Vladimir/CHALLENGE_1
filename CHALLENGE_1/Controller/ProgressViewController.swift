//
//  ProgressViewController.swift
//  CHALLENGE_1
//
//  Created by Artur Imanbaev on 05.02.2023.
//

import UIKit
class ProgressViewController: UIViewController {
    let amountsOfWin = ["100","200","300","500","1000"
                        ,"2000","4000","8000","16000","32000"
                        ,"64000","125000","250000","500000"
                        ,"1 Миллион"]
    let stack: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .center
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
    var progressCell = ProgressCell()
    var currentPosition = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
        setupConstraints()
        self.view.addTapGesture(tapNumber: 1, target: self, action: #selector(toBackView))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        makeLabels()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deleteCells()
    }
    func deleteCells(){
        var i = 0
        while(stack.arrangedSubviews.count != 0){
            stack.arrangedSubviews[i].removeFromSuperview()
            i+=1
        }
    }

    func makeLabels(){
        for i in 0..<amountsOfWin.count {
            //create question cell
            let questionCell = UIImageView()
            let width = UIScreen.main.bounds.size.width
            questionCell.image = UIImage(named: checkColorOfRectangle(i))
            questionCell.contentMode = .scaleToFill
            questionCell.translatesAutoresizingMaskIntoConstraints = false
            questionCell.widthAnchor.constraint(equalToConstant: width * (1 - CGFloat(5) * 0.035)).isActive = true
            //create label and subView it on question cell
//            progressCell.setProgressCell(checkColorOfRectangle(i))
//            let questionCell = progressCell.getProgressCell()
            let labelTextNumberOfQuestion = UILabel()
            labelTextNumberOfQuestion.text = "Вопрос \(amountsOfWin.count - i)"
            labelTextNumberOfQuestion.textColor = .white
            labelTextNumberOfQuestion.font = .systemFont(ofSize: 20)
            labelTextNumberOfQuestion.numberOfLines = 0
            labelTextNumberOfQuestion.translatesAutoresizingMaskIntoConstraints = false
            
            let labelAmountOfMoney = UILabel()
            labelAmountOfMoney.text = "\(amountsOfWin[amountsOfWin.count - i - 1]) \(checkLastQuestion(i))"
            labelAmountOfMoney.textColor = .white
            labelAmountOfMoney.font = .systemFont(ofSize: 20)
            labelAmountOfMoney.numberOfLines = 0
            labelAmountOfMoney.translatesAutoresizingMaskIntoConstraints = false
            
            questionCell.addSubview(labelTextNumberOfQuestion)
            questionCell.addSubview(labelAmountOfMoney)
            
            
            labelTextNumberOfQuestion.leadingAnchor.constraint(equalToSystemSpacingAfter: questionCell.leadingAnchor, multiplier: 3).isActive = true
            labelTextNumberOfQuestion.centerYAnchor.constraint(equalTo: questionCell.centerYAnchor).isActive = true
            
            
            questionCell.trailingAnchor.constraint(equalToSystemSpacingAfter: labelAmountOfMoney.trailingAnchor, multiplier: 3).isActive = true
            labelAmountOfMoney.centerYAnchor.constraint(equalTo: questionCell.centerYAnchor).isActive = true
            
            stack.addArrangedSubview(questionCell)
        }
    }

    func checkColorOfRectangle(_ index: Int) -> String{
        let position = amountsOfWin.count - index
        if(position == 5) || (position == 10){
            return "Rectangle blue"
        }
        else if (position == 15){
            return "Rectangle yellow"
        }
        else if (position == currentPosition){
            return "Rectangle green"
        }
        else{
            return "Rectangle violet"
        }
    }
    func checkLastQuestion(_ index: Int) -> String{
        if(index + 1 == 1){
            return ""
        } else {
            return "RUB"
        }
    }
    @objc func toBackView() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ProgressViewController{
    func setupConstraints(){
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 10),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        view.addSubview(imageIcon)
        NSLayoutConstraint.activate([
            imageIcon.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            imageIcon.bottomAnchor.constraint(equalTo: stack.safeAreaLayoutGuide.topAnchor),
            imageIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
