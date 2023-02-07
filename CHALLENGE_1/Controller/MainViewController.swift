//
//  MainViewController.swift
//  CHALLENGE_1
//
//  Created by Meddor on 05.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var questionVariant = ["A", "B", "C", "D"]
    
    var stack: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 34
        return view
    }()
    
    var podskazkaStack: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = 34
        return view
    }()
    
    var BackgroundImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "backgroundImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    var mainImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "mainImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    var quatinLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "What year was the year, when first deodorant was invented in our life  What year was the year, when first deodorant was invented in our life?What year was the year, when first deodorant was invented in our life??"
        view.font = UIFont(name: "Roboto-Medium", size: 24)
        view.numberOfLines = 0
        
        return view
    }()
    var quatinNumberLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Question 2"
        view.font = UIFont(name: "Roboto-Medium", size: 24)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        
        return view
    }()
    var summQuation: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .white
        view.text = "500 RUB"
        view.font = UIFont(name: "Roboto-Medium", size: 24)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        
        return view
    }()
    
//    //MARK: Функция Градиента
    func applyGradients(sender: UIButton) {

        let gradient = CAGradientLayer()

        let colorTop = #colorLiteral(red: 0.199926585, green: 0.3648718894, blue: 0.4936357737, alpha: 1).cgColor
        let bottomColor = #colorLiteral(red: 0.1125075445, green: 0.2618700266, blue: 0.281789422, alpha: 1).cgColor

        gradient.colors = [colorTop,bottomColor,colorTop]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.cornerRadius = 16
        gradient.frame = sender.bounds

        sender.layer.addSublayer(gradient)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        uzerIntefaseConstrates()
        makeQuestionButtons()
        makePodskazkaButton()
    }

    func makeQuestionButtons() {
        
        for i in questionVariant {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = .white
            button.layer.cornerRadius = 16
            button.backgroundColor = .gray
            
            let labelAmountOfMoney = UILabel()
            labelAmountOfMoney.text = "\(i)"
            labelAmountOfMoney.textColor = .white
            labelAmountOfMoney.font = .systemFont(ofSize: 20)
            labelAmountOfMoney.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(labelAmountOfMoney)
            labelAmountOfMoney.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            labelAmountOfMoney.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            stack.addArrangedSubview(button)
        }
    }
    func makePodskazkaButton() {
        
        let imagesNames = ["fifty", "mistake", "phoneCall"]
        
        for i in 0...2 {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: imagesNames[i]), for: .normal)
            
            button.widthAnchor.constraint(equalToConstant: 105).isActive = true
            button.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
            podskazkaStack.addArrangedSubview(button)
        }
    }
//    //-MARK: неоюходим для получения градиента после инициализации NSLayotConstranes
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()


    }
    
    // -MARK: NSLayoutConstrates (Ящик пандоры)
    func uzerIntefaseConstrates() {
        view.addSubview(BackgroundImage)
        NSLayoutConstraint.activate([
            BackgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            BackgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            BackgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            BackgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.addSubview(mainImage)
        NSLayoutConstraint.activate([
            mainImage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 7),
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainImage.widthAnchor.constraint(equalToConstant: 95),
            mainImage.heightAnchor.constraint(equalToConstant: 95)
        ])
        view.addSubview(quatinLabel)
        NSLayoutConstraint.activate([
            quatinLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            quatinLabel.leftAnchor.constraint(equalTo: mainImage.rightAnchor,constant: 7),
            quatinLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -7),
            quatinLabel.widthAnchor.constraint(equalToConstant: 281),
            quatinLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        view.addSubview(quatinNumberLabel)
        NSLayoutConstraint.activate([
            quatinNumberLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 120),
            quatinNumberLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
        ])
        view.addSubview(summQuation)
        NSLayoutConstraint.activate([
            summQuation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 120),
            summQuation.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            summQuation.heightAnchor.constraint(equalToConstant: 29)
        ])
        
        view.addSubview(stack)
        stack.topAnchor.constraint(equalTo: summQuation.bottomAnchor,constant: 20).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -200).isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        
        view.addSubview(podskazkaStack)
        podskazkaStack.topAnchor.constraint(equalTo: stack.bottomAnchor,constant: 65).isActive = true
        podskazkaStack.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        podskazkaStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -8).isActive = true
        podskazkaStack.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
    }
}

