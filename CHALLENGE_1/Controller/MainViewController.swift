//
//  MainViewController.swift
//  CHALLENGE_1
//
//  Created by Meddor on 05.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let imageForButtonBlue = UIImage(named: "Rectangle")
    
    var BackgroundImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "bacground")
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
        view.tintColor = .white
        view.text = "What year was the year, when first deodorant was invented in our life  What year was the year, when first deodorant was invented in our life?What year was the year, when first deodorant was invented in our life??"
        view.font = UIFont(name: "Roboto-Medium", size: 24)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        
        return view
    }()
    var quatinNumberLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .white
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
    var buttonA: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "Rectangle"), for: .normal)
        view.layer.cornerRadius = 16
        view.backgroundColor = .black
        view.contentMode = .scaleToFill
        
        
        return view
    }()
    var buttonB: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "Rectangle"), for: .normal)
        view.layer.cornerRadius = 16
        view.backgroundColor = .black
        
        
        
        return view
    }()
    var buttonC: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "Rectangle"), for: .normal)
        view.layer.cornerRadius = 16
        view.backgroundColor = .black
        
        
        
        return view
    }()
    var buttonD: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "Rectangle"), for: .normal)
        view.layer.cornerRadius = 16
        view.backgroundColor = .black
        
        
        return view
    }()
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uzerIntefaseConstrates()
    }
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
            mainImage.widthAnchor.constraint(equalToConstant: 87),
            mainImage.heightAnchor.constraint(equalToConstant: 87)
        ])
        view.addSubview(quatinLabel)
        NSLayoutConstraint.activate([
            quatinLabel.topAnchor.constraint(equalTo: mainImage.topAnchor),
            quatinLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 128),
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
            buttonA.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonA.heightAnchor.constraint(equalToConstant: 54)
        ])
        view.addSubview(buttonB)
        NSLayoutConstraint.activate([
            buttonB.topAnchor.constraint(equalTo: buttonA.bottomAnchor,constant: 32),
            buttonB.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonB.heightAnchor.constraint(equalToConstant: 54)
        ])
        view.addSubview(buttonC)
        NSLayoutConstraint.activate([
            buttonC.topAnchor.constraint(equalTo: buttonB.bottomAnchor,constant: 32),
            buttonC.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonC.heightAnchor.constraint(equalToConstant: 54)
        ])
        view.addSubview(buttonD)
        NSLayoutConstraint.activate([
            buttonD.topAnchor.constraint(equalTo: buttonC.bottomAnchor,constant: 32),
            buttonD.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonD.heightAnchor.constraint(equalToConstant: 54)
        ])
        view.addSubview(podskazka50)
        NSLayoutConstraint.activate([
            podskazka50.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            podskazka50.topAnchor.constraint(equalTo: buttonD.bottomAnchor,constant: 150),
            podskazka50.widthAnchor.constraint(equalToConstant: 105),
            podskazka50.heightAnchor.constraint(equalToConstant: 80)
        ])
        view.addSubview(podskazkaZal)
        NSLayoutConstraint.activate([
            podskazkaZal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            podskazkaZal.topAnchor.constraint(equalTo: buttonD.bottomAnchor,constant: 150),
            podskazkaZal.widthAnchor.constraint(equalToConstant: 105),
            podskazkaZal.heightAnchor.constraint(equalToConstant: 80)
        ])
        view.addSubview(podskazkaZvonok)
        NSLayoutConstraint.activate([
            podskazkaZvonok.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            podskazkaZvonok.topAnchor.constraint(equalTo: buttonD.bottomAnchor,constant: 150),
            podskazkaZvonok.widthAnchor.constraint(equalToConstant: 105),
            podskazkaZvonok.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

