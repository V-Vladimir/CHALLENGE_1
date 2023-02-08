//
//  MainViewController.swift
//  CHALLENGE_1
//
//  Created by Meddor on 05.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let question = CQuestions()
    private var progressView = ProgressViewController()
    //var colors = GradientsColors()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()//(arrangedSubviews: [AnswerButton("1"), AnswerButton("2"), AnswerButton("3"), AnswerButton("4")])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20.0
        return stackView
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
    
    let answerButtons = [AnswerButton](arrayLiteral: AnswerButton(0, "1"), AnswerButton(1, "2"), AnswerButton(2, "3"), AnswerButton(3, "4"))
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
        view.setImage(UIImage(named: "fifty"), for: .normal)
        view.addTarget(self, action: #selector(pushFiftyAndFifty), for: .touchUpInside)
        
        return view
    }()
    var podskazkaZal: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "mistake"), for: .normal)
        button.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
        return button
    }()
    var podskazkaZvonok: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "phoneCall"), for: .normal)
        
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
        
        //sender.layer.addSublayer(gradient)
        sender.layer.insertSublayer(gradient, at: 0)

    }

    @objc func presentModalController() {
        let vc = CustomModalViewController()
        vc.setCQuestionsValue(question)
        vc.modalPresentationStyle = .overCurrentContext
        // keep false
        // modal animation will be handled in VC itself
        self.present(vc, animated: false)
    }
    
    @objc func pushFiftyAndFifty() {
        let arrayIndex = question.getFiftyAndFiftyIndex()
        print("\(arrayIndex)")
        for index in Range(0...3) {
            if !arrayIndex.contains(index) {
                answerButtons[index].setText("")
            }
        }
    }
    func setActiveHelperButton(){
        let arrayButton = question.activeHelpers()
        for item in arrayButton {
//            switch item {
//            case 0:
//                //podskazka50.set
//
//            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        uzerIntefaseConstrates()
        showQuestion()
  
    }
    //-MARK: неоюходим для получения градиента после инициализации NSLayotConstranes
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        self.applyGradients(sender: buttonA)
//        self.applyGradients(sender: buttonB)
//        self.applyGradients(sender: buttonC)
//        self.applyGradients(sender: buttonD)
        for button in answerButtons {
            //contentStackView.addArrangedSubview(button)
            button.applyGradients()
            button.addTarget(self, action: #selector(pushAnswerButton), for: .touchUpInside)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showQuestion()
    }
    
    func showQuestion() {
        let question = self.question.getAciveQuestion()
        quatinLabel.text = question.question
        quatinNumberLabel.text = "Qusetion \(self.question.getPosition())"
        for index in Range(0...3) {
            answerButtons[index].setText(question.answers[index])
        }
    }
    
    @objc func pushAnswerButton(_ sender:UIButton) {
        print(sender.tag)
        if self.question.checkAnswer(sender.tag) {
            _ = self.question.nextQuestion()
            self.navigationController!.pushViewController(progressView, animated: true)
        } else {
            if !self.question.isMakeMistake() {
                //toDo animation in 2-3 sec
                question.activeMistakeHelp()
                _ = self.question.nextQuestion()
                self.navigationController!.pushViewController(progressView, animated: true)
            } else {
                var navStackArray : [UIViewController]! = [self.navigationController!.viewControllers[0]]
                navStackArray.insert(FinalController(), at: navStackArray.count)
                navStackArray.insert(progressView, at: navStackArray.count)
                self.navigationController!.setViewControllers(navStackArray, animated:true)
            }
        }
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
        
        view.addSubview(contentStackView)
        for button in answerButtons {
            contentStackView.addArrangedSubview(button)
        }
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 180),
            contentStackView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            contentStackView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            contentStackView.heightAnchor.constraint(equalToConstant: 65 * 5)
        ])
//        view.addSubview(buttonA)
//        NSLayoutConstraint.activate([
//            buttonA.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 180),
//            buttonA.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
//            buttonA.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
//            buttonA.heightAnchor.constraint(equalToConstant: 65)
//        ])
//        view.addSubview(buttonB)
//        NSLayoutConstraint.activate([
//            buttonB.topAnchor.constraint(equalTo: buttonA.bottomAnchor,constant: 32),
//            buttonB.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
//            buttonB.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
//            buttonB.heightAnchor.constraint(equalToConstant: 65)
//        ])
//        view.addSubview(buttonC)
//        NSLayoutConstraint.activate([
//            buttonC.topAnchor.constraint(equalTo: buttonB.bottomAnchor,constant: 32),
//            buttonC.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
//            buttonC.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
//            buttonC.heightAnchor.constraint(equalToConstant: 65)
//        ])
//        view.addSubview(buttonD)
//        NSLayoutConstraint.activate([
//            buttonD.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
//            buttonD.topAnchor.constraint(equalTo: buttonC.bottomAnchor,constant: 32),
//            buttonD.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
//            buttonD.heightAnchor.constraint(equalToConstant: 65),
//        ])
        view.addSubview(podskazka50)
        NSLayoutConstraint.activate([
            podskazka50.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            podskazka50.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30),
            podskazka50.widthAnchor.constraint(equalToConstant: 105),
            podskazka50.heightAnchor.constraint(equalToConstant: 80)
        ])
        view.addSubview(podskazkaZal)
        NSLayoutConstraint.activate([
            podskazkaZal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            podskazkaZal.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30),
            podskazkaZal.widthAnchor.constraint(equalToConstant: 105),
            podskazkaZal.heightAnchor.constraint(equalToConstant: 80)
        ])
        view.addSubview(podskazkaZvonok)
        NSLayoutConstraint.activate([
            podskazkaZvonok.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            podskazkaZvonok.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30),
            podskazkaZvonok.widthAnchor.constraint(equalToConstant: 105),
            podskazkaZvonok.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

