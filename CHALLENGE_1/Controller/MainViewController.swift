//
//  MainViewController.swift
//  CHALLENGE_1
//
//  Created by Meddor on 05.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
     let question = CQuestions()
    private let giveMoneyButton = GiveMyMoneyButton("0")
    private var progressView = ProgressViewController()
    private var mistakeButton:HelperButton?
    var preMadeSounds = PreMadeSounds()
    
    let baseStack: UIStackView = {
        $0.axis = .vertical
        //$0.alignment = .center
        $0.distribution = .equalCentering
        $0.spacing = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20.0
        return stackView
    }()
    
    var podskazkaStack: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = 34
        return view
    }()
    
    var headerStack: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = 34
        return view
    }()
    
    var questionLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "What year was the year, when first deodorant was invented in our life  What year was the year, when first deodorant was invented in our life?What year was the year, when first deodorant was invented in our life??"
        view.font = UIFont(name: "Roboto-Medium", size: 24)
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.5
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
    
    let answerButtons = [AnswerButton](arrayLiteral: AnswerButton(0, "1"), AnswerButton(1, "2"), AnswerButton(2, "3"), AnswerButton(3, "4"))

    @objc func presentModalController(_ sender: HelperButton) {
        sender.setDisableImage()
        let vc = CustomModalViewController()
        vc.setCQuestionsValue(question)
        vc.modalPresentationStyle = .overCurrentContext
        // keep false
        // modal animation will be handled in VC itself
        self.present(vc, animated: false)
    }
    
    @objc func pushFiftyAndFifty(_ sender: HelperButton) {
        sender.setDisableImage()
        let arrayIndex = question.getFiftyAndFiftyIndex()
        print("\(arrayIndex)")
        for index in Range(0...3) {
            if !arrayIndex.contains(index) {
                answerButtons[index].setText("")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
        view.backgroundColor = .gray
        uzerIntefaseConstrates()
        for button in answerButtons {
            button.addTarget(self, action: #selector(pushAnswerButton), for: .touchUpInside)
        }
        giveMoneyButton.addTarget(self, action: #selector(pushMoney), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCurrentQuestion()
    }
    
    func loadCurrentQuestion() {
        let question = self.question.getActiveQuestion()
        questionLabel.text = question.question
        quatinNumberLabel.text = "Qusetion \(self.question.getPosition())"
        for index in Range(0...3) {
            answerButtons[index].setText(question.answers[index])
        }
    }
    
    @objc func pushMoney() {
        let alertController = UIAlertController(title: "Money", message: "Do you have my money?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Return", style: .cancel) { (action) in
            print("Go back")
        }
        alertController.addAction(cancelAction)

        let destroyAction = UIAlertAction(title: "Transfer", style: .destructive) { (action) in
            var navStackArray : [UIViewController]! = [self.navigationController!.viewControllers[0]]
            navStackArray.insert(FinalController(), at: navStackArray.count)
            self.navigationController!.setViewControllers(navStackArray, animated:true)
        }
        alertController.addAction(destroyAction)
        self.present(alertController, animated: true)
    }
        
    @objc func pushAnswerButton(_ sender:AnswerButton) {
        if self.question.checkAnswer(sender.tag) {
            _ = self.question.nextQuestion()
            self.navigationController!.pushViewController(progressView, animated: true)
        } else {
            if !self.question.isMakeMistake() {
                mistakeButton!.setDisableImage()
                self.question.activeMistakeHelp()
                sender.setMistakeStatus()//<--- toDo
                return
            }
            //toDo animation in 2-3 sec
            var navStackArray : [UIViewController]! = [self.navigationController!.viewControllers[0]]
            navStackArray.insert(FinalController(), at: navStackArray.count)
            navStackArray.insert(progressView, at: navStackArray.count)
            self.navigationController!.setViewControllers(navStackArray, animated:true)
        }
    }

    // -MARK: NSLayoutConstrates (Ящик пандоры)
    func uzerIntefaseConstrates() {
        view.addSubview(baseStack)
        NSLayoutConstraint.activate([
            baseStack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            baseStack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            baseStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            baseStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        baseStack.addArrangedSubview(questionLabel)
        baseStack.addArrangedSubview(headerStack)
        
        headerStack.addArrangedSubview(quatinNumberLabel)
        headerStack.addArrangedSubview(giveMoneyButton)
        
        giveMoneyButton.setText("500000 RUB")
        
        baseStack.addArrangedSubview(contentStackView)
        for button in answerButtons {
            contentStackView.addArrangedSubview(button)
        }
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        baseStack.addArrangedSubview(podskazkaStack)
        
        let fiftyButton = HelperButton("fifty", "fifty-used")
        fiftyButton.addTarget(self, action: #selector(pushFiftyAndFifty), for: .touchUpInside)
        let peopleButton = HelperButton("phoneCall", "phoneCall-used")
        peopleButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
        mistakeButton = HelperButton("mistake", "mistake-used")
        
        podskazkaStack.addArrangedSubview(fiftyButton)
        podskazkaStack.addArrangedSubview(peopleButton)
        podskazkaStack.addArrangedSubview(mistakeButton!)

        podskazkaStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: baseStack.safeAreaLayoutGuide.topAnchor),
            questionLabel.heightAnchor.constraint(equalToConstant: 190),

            headerStack.heightAnchor.constraint(equalToConstant: 50),
            headerStack.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),

            contentStackView.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 20),
            contentStackView.bottomAnchor.constraint(equalTo: podskazkaStack.topAnchor, constant: -20),
                  
            podskazkaStack.bottomAnchor.constraint(equalTo: baseStack.bottomAnchor),
            podskazkaStack.heightAnchor.constraint(equalToConstant: 150)
            
        ])
    }
}

