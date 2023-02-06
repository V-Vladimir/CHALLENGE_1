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
    let labelText: UILabel = {
        $0.text = "Вопрос 1                         100"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
        makeLabels()
        setupConstraints()
        
        
    }
    func makeLabels(){
        for _ in 0..<15{
            let questionCell: UIImageView = {
            let width = UIScreen.main.bounds.size.width
            $0.image = UIImage(named: "Rectangle violet")
            $0.contentMode = .scaleToFill
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: width * (1 - CGFloat(2) * 0.035)).isActive = true
            return $0
        }(UIImageView())
        questionCell.addSubview(labelText)
        labelText.centerYAnchor.constraint(equalTo: questionCell.centerYAnchor).isActive = true
        labelText.centerXAnchor.constraint(equalTo: questionCell.centerXAnchor).isActive = true
        stack.addArrangedSubview(questionCell)
        }
    }

}

extension UIView {
    func addBackground() {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
        imageViewBackground.image = UIImage(named: "background")

        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
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
    }
}
