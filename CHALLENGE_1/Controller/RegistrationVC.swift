//
//  RegistrationVC.swift
//  CHALLENGE_1
//
//  Created by Aleksandr Kan on 10/02/23.
//

import UIKit

class RegistrationVC: UIViewController {
    
    private let textField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter your name"
        field.textColor = .black
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: field.frame.height))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.clearButtonMode = .always
        field.returnKeyType = .done
        field.layer.cornerRadius = 10
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.backgroundColor = .specialGreenColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(saveName), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Setup Views
    private func setupViews() {
        textField.delegate = self
        view.addBackground()
        view.addSubview(textField)
        view.addSubview(saveButton)
    }
    
    //MARK: - Setup Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 30),
            textField.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            saveButton.centerXAnchor.constraint(equalTo: textField.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    //MARK: - Selector
    @objc
    private func saveName() {
        guard textField.text?.count != 0, let name = textField.text else {
            alertOk(title: "Ошибка", message: "Поле не может быть пустым")
            return }
        
        let mainVC = MainViewController()
        mainVC.question.player.name = name
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true)
    }
    
}


extension RegistrationVC: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        true
    }
    
    
}
