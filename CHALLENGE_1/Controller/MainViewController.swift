//
//  MainViewController.swift
//  CHALLENGE_1
//
//  Created by Meddor on 05.02.2023.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
    private let localRealm = try! Realm()
    private var playerModel = PlayerModel()
//    private var seconds = 30
    private var timer: Timer?
    private var soundManager = SoundManager()
    
    var question = CQuestions()
    private let giveMoneyButton = GiveMyMoneyButton("0")
    private var progressView:ProgressViewController?
    private var mistakeButton:HelperButton?

    //var preMadeSounds = PreMadeSounds()
    
    let finalVC = FinalController()
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        progressView = ProgressViewController(question)
    }
    
    
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
            button.addTarget(self, action: #selector(finishQuestionTimer), for: .touchUpInside)
        }
        //giveMoneyButton.addTarget(self, action: #selector(pushMoney), for: .touchUpInside)
        
        finalVC.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _ = self.question.nextQuestion()
        loadCurrentQuestion()
        startQuestionTimer()
        
        //startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //soundManager.mistakePlay()
//        timer?.invalidate()
    }
    
    //MARK: Timer
    @objc func startQuestionTimer() {
        isEnableUserInteraction(true)
        let duration = 6.0
        timer?.invalidate()
        soundManager.answer(urlSound: .timeGoing)
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(duration), target: self, selector: #selector(finishQuestionTimer), userInfo: nil, repeats: false)
    }
    
    @objc func finishQuestionTimer(_ sender:NSObject) {
        isEnableUserInteraction(false)
        if ((sender as? AnswerButton) != nil) {
            _ = self.question.checkAnswer((sender as! AnswerButton).tag)
            (sender as! AnswerButton).setSelectStatus()
        } else {
            self.question.lastAnswerIndex = -1
        }
        timer?.invalidate()
        soundManager.answer(urlSound: .answerAccepted)
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(checkAnswerTimer), userInfo: nil, repeats: false)
    }
    
    @objc func checkAnswerTimer() {
        let duration = 3.0
        timer?.invalidate()
        let buttonIndex = question.lastIndexQuestion()
        // if button Index <0 then timer has worked
        if (buttonIndex < 0) {
            if !self.question.isMakeMistake() {
                mistakeButton!.setDisableImage()
                question.activeMistakeHelp()
                soundManager.answer(urlSound: .answerWrong)
                timer = Timer.scheduledTimer(timeInterval: TimeInterval(duration), target: self, selector: #selector(startQuestionTimer), userInfo: nil, repeats: false)
                return
            }
            soundManager.answer(urlSound: .answerWrong)
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(duration), target: self, selector: #selector(gameOver), userInfo: nil, repeats: false)
            return
        }
        
        if (question.statusLastQuestion()) {
            soundManager.answer(urlSound: .answerCorrect)
            answerButtons[buttonIndex].setCorrectStatus()
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(duration), target: self, selector: #selector(nextQuestionController), userInfo: nil, repeats: false)
        } else {
            soundManager.answer(urlSound: .answerWrong)
            answerButtons[buttonIndex].setMistakeStatus()
            
            if self.question.isMakeMistake() {
                timer = Timer.scheduledTimer(timeInterval: TimeInterval(duration), target: self, selector: #selector(gameOver), userInfo: nil, repeats: false)
                return
            }
            mistakeButton!.setDisableImage()
            question.activeMistakeHelp()
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(duration), target: self, selector: #selector(startQuestionTimer), userInfo: nil, repeats: false)
        }
    }
    
    @objc func nextQuestionController() {
        soundManager.stop()
        if (question.getPosition()) == question.countQustion() {
            var navStackArray : [UIViewController]! = [self.navigationController!.viewControllers[0]]
            finalVC.setWinText(question.getWinSumm())
            finalVC.showResult(isWin: true, questionNumber: question.getPosition())
            
            navStackArray.insert(finalVC, at: navStackArray.count)
            self.navigationController!.setViewControllers(navStackArray, animated:true)
            return
        }
        //progressView!.currentPosition = question.getPosition() + 1
        progressView?.setCurrentPosition(question.getPosition())
        self.navigationController?.pushViewController(progressView!, animated: true)
    }
    
    @objc func gameOver() {
        var navStackArray : [UIViewController]! = [self.navigationController!.viewControllers[0]]
        finalVC.setWinText(question.getWinSumm())
        finalVC.showResult(isWin: false, questionNumber: question.getPosition())
        
        navStackArray.insert(finalVC, at: navStackArray.count)
        navStackArray.insert(progressView!, at: navStackArray.count)
        self.navigationController!.setViewControllers(navStackArray, animated:true)
    }
        
    func loadCurrentQuestion() {
        let question = self.question.getActiveQuestion()
        questionLabel.text = question.question
        quatinNumberLabel.text = "Qusetion \(self.question.getPosition())"
        for index in Range(0...(answerButtons.count-1)) {
            answerButtons[index].setText(question.answers[index])
        }
        giveMoneyButton.setText(self.question.getSumQuestion())
    }

    func isEnableUserInteraction(_ flag:Bool) {
        let _ = self.view.subviews.map { $0.isUserInteractionEnabled = flag }
    }

    func loseGame() {
        var navStackArray : [UIViewController]! = [self.navigationController!.viewControllers[0]]
            navStackArray.insert(FinalController(), at: navStackArray.count)
            navStackArray.insert(progressView!, at: navStackArray.count)
            self.navigationController!.setViewControllers(navStackArray, animated:true)
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
    
    //MARK: - Setup for Realm
    private func createModel() {
        playerModel.playerName = question.player.name
        playerModel.levelQuestion = question.player.questionLevel
        playerModel.date = question.player.date
    }
    
    private func saveModel() {
        RealmManager.shared.savePlayerModel(playerModel)
        playerModel = PlayerModel()
        resetPlayerModel()
    }
    
    private func resetPlayerModel() {
        question.player.reset()
    }
}

//MARK: - Setting delegate
extension MainViewController: FinalControllerDelegate {
    
    func saveResults(controller: FinalController) {
        createModel()
        saveModel()
    }
}
