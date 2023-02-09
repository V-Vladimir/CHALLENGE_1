//
//  RuleViewController.swift
//  CHALLENGE_1
//
//  Created by Aleksandr Kan on 06/02/23.
//

import UIKit

class RuleViewController: UIViewController {
    
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
        self.view.addBackground()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(ruleLabel)
        view.addSubview(textRule)
    }
    
    //MARK: - Set constraints
    
    private func setConstraints() {
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
