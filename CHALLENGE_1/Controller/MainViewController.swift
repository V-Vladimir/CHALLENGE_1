//
//  MainViewController.swift
//  CHALLENGE_1
//
//  Created by Meddor on 05.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //var colors = GradientsColors()
    
    var BackgroundImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "Frame")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    var mainImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "MainLabelMillionair")
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
    
    //-MARK: Кнопки с вариантими ответов
    
    var buttonA: UIButton = {
        var view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("ButtonA", for: .normal)
        
        return view
    }()
    
    var buttonB: UIButton = {
        var view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("ButtonB", for: .normal)
        
        return view
    }()
    
    var buttonC: UIButton = {
        var view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("ButtonC", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 25)
        view.tintColor = .white
        view.layer.cornerRadius = 16
        
        return view
    }()
    
    var buttonD: UIButton = {
        var view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("ButtonD", for: .normal)
        
        return view
    }()
    
    //-MARK: Кнопки с подсказками
    var podskazka50: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "Podskazka50"), for: .normal)
        
        return view
    }()
    var podskazkaZal: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "PodskazkaZal"), for: .normal)
        
        return view
    }()
    var podskazkaZvonok: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "PodskazkaZvonok"), for: .normal)
        
        return view
    }()
    
    
    //MARK: Функция Градиента 
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
  
    }
    //-MARK: неоюходим для получения градиента после инициализации NSLayotConstranes
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        
        self.applyGradients(sender: buttonA)
        self.applyGradients(sender: buttonB)
        self.applyGradients(sender: buttonC)
        self.applyGradients(sender: buttonD)
        
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
        ])
        view.addSubview(buttonA)
        NSLayoutConstraint.activate([
            buttonA.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 180),
            buttonA.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            buttonA.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            buttonA.heightAnchor.constraint(equalToConstant: 65)
        ])
        view.addSubview(buttonB)
        NSLayoutConstraint.activate([
            buttonB.topAnchor.constraint(equalTo: buttonA.bottomAnchor,constant: 32),
            buttonB.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            buttonB.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            buttonB.heightAnchor.constraint(equalToConstant: 65)
        ])
        view.addSubview(buttonC)
        NSLayoutConstraint.activate([
            buttonC.topAnchor.constraint(equalTo: buttonB.bottomAnchor,constant: 32),
            buttonC.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            buttonC.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            buttonC.heightAnchor.constraint(equalToConstant: 65)
        ])
        view.addSubview(buttonD)
        NSLayoutConstraint.activate([
            buttonD.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            buttonD.topAnchor.constraint(equalTo: buttonC.bottomAnchor,constant: 32),
            buttonD.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            buttonD.heightAnchor.constraint(equalToConstant: 65),
        ])
        view.addSubview(podskazka50)
        NSLayoutConstraint.activate([
            podskazka50.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            podskazka50.topAnchor.constraint(equalTo: buttonD.bottomAnchor,constant: 130),
            podskazka50.widthAnchor.constraint(equalToConstant: 105),
            podskazka50.heightAnchor.constraint(equalToConstant: 80)
        ])
        view.addSubview(podskazkaZal)
        NSLayoutConstraint.activate([
            podskazkaZal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            podskazkaZal.topAnchor.constraint(equalTo: buttonD.bottomAnchor,constant: 130),
            podskazkaZal.widthAnchor.constraint(equalToConstant: 105),
            podskazkaZal.heightAnchor.constraint(equalToConstant: 80)
        ])
        view.addSubview(podskazkaZvonok)
        NSLayoutConstraint.activate([
            podskazkaZvonok.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            podskazkaZvonok.topAnchor.constraint(equalTo: buttonD.bottomAnchor,constant: 130),
            podskazkaZvonok.widthAnchor.constraint(equalToConstant: 105),
            podskazkaZvonok.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

