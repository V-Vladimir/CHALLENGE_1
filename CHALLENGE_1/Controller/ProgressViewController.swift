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
        $0.spacing = 40
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    let questionCell: UIImageView = {
        let width = UIScreen.main.bounds.size.width
        $0.image = UIImage(named: "Rectangle violet")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    let labelText: UILabel = {
        $0.text = "Вопрос 1"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 15)
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
        for i in 0..<15{
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
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }
}
