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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
        makeLabels()
        setupConstraints()
        self.view.addTapGesture(tapNumber: 1, target: self, action: #selector(toBackView))
    }
    func makeLabels() {
        for i in 0..<15{
            //create question cell
            let questionCell = UIImageView()
            let width = UIScreen.main.bounds.size.width
            questionCell.image = UIImage(named: "Rectangle violet")
            questionCell.contentMode = .scaleToFill
            questionCell.translatesAutoresizingMaskIntoConstraints = false
            questionCell.widthAnchor.constraint(equalToConstant: width * (1 - CGFloat(2) * 0.035)).isActive = true
            //create label and subView it on question cell
            let labelTextNumberOfQuestion = UILabel()
            labelTextNumberOfQuestion.text = "Вопрос \(amountsOfWin.count - i)"
            labelTextNumberOfQuestion.textColor = .white
            labelTextNumberOfQuestion.font = .systemFont(ofSize: 20)
            labelTextNumberOfQuestion.numberOfLines = 0
            labelTextNumberOfQuestion.translatesAutoresizingMaskIntoConstraints = false
            
            let labelAmountOfMoney = UILabel()
            labelAmountOfMoney.text = "\(amountsOfWin[amountsOfWin.count - i - 1])  RUB"
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
    @objc func toBackView() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UIView {
    func addBackground() {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
        imageViewBackground.image = UIImage(named: "backgroundImage")

        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
}
extension UIView {
  func addTapGesture(tapNumber: Int, target: Any, action: Selector) {
    let tap = UITapGestureRecognizer(target: target, action: action)
    tap.numberOfTapsRequired = tapNumber
    addGestureRecognizer(tap)
    isUserInteractionEnabled = true
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
