//
//  RuleViewController.swift
//  CHALLENGE_1
//
//  Created by Aleksandr Kan on 06/02/23.
//

import UIKit

class RuleViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    private let ruleLabel: UILabel = {
       let label = UILabel()
        label.text = "Правила"
        label.textColor = .white
        label.font = .robotoMedium24()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textRule: UILabel = {
       let label = UILabel()
        label.text = "Здесь могла быть Ваша реклама!"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(ruleLabel)
        view.addSubview(textRule)
    }
    
    //MARK: - Set constraints
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            ruleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            ruleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textRule.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textRule.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }

}
