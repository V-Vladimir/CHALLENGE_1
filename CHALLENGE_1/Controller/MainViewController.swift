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
    private var mistakeButton:HelperButton?
    var preMadeSounds = PreMadeSounds()
    //var colors = GradientsColors()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()//(arrangedSubviews: [AnswerButton("1"), AnswerButton("2"), AnswerButton("3"), AnswerButton("4")])
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

    
    var BackgroundImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "backgroundImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    var quatinLabel: UILabel = {
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
        view.backgroundColor = .gray
        uzerIntefaseConstrates()
        for button in answerButtons {
            button.addTarget(self, action: #selector(pushAnswerButton), for: .touchUpInside)
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCurrentQuestion()
    }
    
    func loadCurrentQuestion() {
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
                mistakeButton!.setDisableImage() //<--- toDo
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
        view.addSubview(quatinLabel)
        NSLayoutConstraint.activate([
            quatinLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            quatinLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            quatinLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            quatinLabel.heightAnchor.constraint(equalToConstant: 150)
        ])
        view.addSubview(quatinNumberLabel)
        NSLayoutConstraint.activate([
            quatinNumberLabel.topAnchor.constraint(equalTo: quatinLabel.bottomAnchor,constant: 45),
            quatinNumberLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
        ])
        view.addSubview(summQuation)
        NSLayoutConstraint.activate([
            summQuation.topAnchor.constraint(equalTo: quatinLabel.bottomAnchor,constant: 45),
            summQuation.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
        ])

        view.addSubview(contentStackView)
        for button in answerButtons {
            contentStackView.addArrangedSubview(button)
        }
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: summQuation.bottomAnchor,constant: 70),
            contentStackView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            contentStackView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            contentStackView.heightAnchor.constraint(equalToConstant: 65 * 5)
        ])
        
        view.addSubview(podskazkaStack)
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
            podskazkaStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
            podskazkaStack.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            podskazkaStack.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
        ])
    }
}

