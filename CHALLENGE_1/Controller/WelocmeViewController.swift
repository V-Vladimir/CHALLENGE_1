//
//  ViewController.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 05.02.2023.
//

import UIKit

class WelocmeViewController: UIViewController {
    private var soundManager = SoundManager()
    
    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mainImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
       let label = UILabel()
        label.text = "Welcome"
        label.textColor = .white
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "to Who Wants \nto be a Millionare"
        label.numberOfLines = 2
        label.font = .robotoMedium32()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rulesButton: UIButton = {
        let title = String.getSpecialString(text: "Правила игры",with: .specialGreenColor)
        let button = UIButton(type: .system)
        button.setAttributedTitle(title, for: .normal)
        button.setTitleColor(.specialGreenColor, for: .normal)
        button.addTarget(self, action: #selector(touchRules), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var startButton: UIButton = {
        let title = String.getSpecialString(text: "Начать игру", with: .specialGreenColor)
        let button = UIButton(type: .system)
        button.setAttributedTitle(title, for: .normal)
        button.setTitleColor(.specialGreenColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(navigationToMainView), for: .touchUpInside)
        return button
    }()
    
    private lazy var ratingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "rating")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(showRating), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
        // Do any additional setup after loading the view.
        setupViews()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        soundManager.playSound(urlSound: .mainSound)
    }
    
    override func viewWillDisappear(_ boolFlag :Bool) {
        super.viewWillDisappear(boolFlag)
        //self.navigationController?.viewControllers.remove(at: 0)
    }
    
    private func setupViews() {
        view.addSubview(mainImage)
        view.addSubview(welcomeLabel)
        view.addSubview(nameLabel)
        view.addSubview(rulesButton)
        view.addSubview(startButton)
        view.addSubview(ratingButton)
    }
    
    //MARK: - Selectors
    
    @objc
    private func touchRules() {
        let ruleVC = RuleViewController()
        present(ruleVC, animated: true)
    }
    
    @objc
    private func navigationToMainView() {
        soundManager.stop()
        let mainVC = RegistrationVC()
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    @objc
    private func showRating() {
        let ratingVc = RatingVC()
        ratingVc.modalTransitionStyle = .flipHorizontal
        present(ratingVc, animated: true)
    }
    
}

//MARK: - Set Constraints
extension WelocmeViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60.0),
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.widthAnchor.constraint(equalToConstant: 225),
            mainImage.heightAnchor.constraint(equalToConstant: 225)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 15),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rulesButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 100),
            rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: rulesButton.bottomAnchor, constant: 5),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ratingButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 100),
            ratingButton.centerXAnchor.constraint(equalTo: startButton.centerXAnchor)
        ])
    }
    
}

