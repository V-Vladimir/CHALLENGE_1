//
//  QuestionManager.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 07.02.2023.
//

import Foundation

enum EnumHelper {
    case mistake
    case fiftyAndFiftyActive
    case peoplesHall
}

final class CQuestions {
    private let amountsOfWin = ["100","200","300","500","1000"
                                ,"2000","4000","8000","16000","32000"
                                ,"64000","125000","250000","500000"
                                ,"1 Миллион"]
    let checkPointPosition:[Int] = [5, 10]
    var player  = Player()
    var playerName = ""
    
    private var questions:[Question] = []
    private var currentPosition = 0 { didSet { player.questionLevel += 1 } } //0
    private var activeAnswer:[Int] = []
    //helper flags
    private var isMistake = false // false
    private var isFiftyAndFiftyActive = false
    private var isPeoplesHall = false
    private var isCorrectLastQuestion = true
    var lastAnswerIndex = -1
    var winPosition = 0
    var isFinish = false
    
    init() {
        loadQuestions()
    }
    
    func reload() {
        questions = []
        loadQuestions()
        currentPosition = 1
        player.reset()
    }
    
    private func loadQuestions() {
        var jsonData:[JsonQuestion] = []
        var dictionary = [Int: [JsonQuestion]]()
        jsonData = JsonQuestion.questions()
        for item in jsonData {
            if dictionary[item.level] == nil {
                dictionary[item.level] = []
            }
            dictionary[item.level]?.append(item)
        }
        for (_, value) in dictionary {
            let jsonQuestion = value.randomElement()
            questions.append( Question(jsonQuestion!.ask,
                                       jsonQuestion!.wrongAnswers,
                                       jsonQuestion!.correctAnswer))
        }
        assert(questions.count == 15)
        for (item) in questions {
            assert(item.answers.count == 4)
        }
    }
    
    // return correct answer
    func getFiftyAndFiftyIndex() -> [Int] {
        self.isFiftyAndFiftyActive = true
        let question = getActiveQuestion()
        activeAnswer = Array(repeating: question.rightAnswerIndex, count: 2)
        repeat {
            activeAnswer[1] = Int.random(in: 0..<4)
        } while activeAnswer[1] == question.rightAnswerIndex
        return activeAnswer
    }
    
    func statusLastQuestion() -> Bool {
        return isCorrectLastQuestion
    }
    
    func lastIndexQuestion() -> Int {
        return lastAnswerIndex
    }
     
    func checkAnswer(_ index:Int) -> Bool {
        lastAnswerIndex = index
        isCorrectLastQuestion = (lastAnswerIndex == getActiveQuestion().rightAnswerIndex) ? true : false
        return isCorrectLastQuestion
    }
    
    func getPeoplePercent() -> [Int] {
        let correctAnswerIndex = questions[currentPosition].rightAnswerIndex
        var array:[Int] = [0,0,0,0]
        let smartPercent = Int(100.0 - Float(currentPosition) * 4.4)
        let stupidPercentStep:Int = Int((100 - smartPercent) / 3)
        for _ in Range(1 ... 100) {
            switch Int.random(in: 0..<100){
            case 0...smartPercent:
                array[0]+=1
            case smartPercent...(smartPercent + stupidPercentStep):
                array[1]+=1
            case (smartPercent + stupidPercentStep)...(smartPercent + stupidPercentStep*2):
                array[2]+=1
            default:
                array[3]+=1
            }
        }
        if correctAnswerIndex != 0 {
            array.swapAt(correctAnswerIndex, 0)
        }
        if (!activeAnswer.isEmpty) {
            var index = 0
            for i in 0..<4 {
                if !activeAnswer.contains(i) {
                    array[activeAnswer[index]]+=array[i]
                    index+=1
                    array[i]=0
                }
            }
        }

        return array
    }
    
    func getActiveQuestion() -> Question {
        return questions[currentPosition - 1 ]
    }
    
    func getPosition() -> Int {
        return currentPosition
    }
    
    func nextQuestion() -> Question {
        if playerName.isEmpty{
            playerName = player.name
        }
        lastAnswerIndex = -1
        isCorrectLastQuestion = false
        currentPosition+=1
        activeAnswer = []
        return getActiveQuestion()
    }
    
    func isMakeMistake() -> Bool {
        return isMistake
    }
    func activeMistakeHelp() {
        isMistake = true
    }
    
    func activeHelpers() -> [Int] {
        return []
    }
    
    func getSumQuestion() -> String {
        return getSumQuestionText(currentPosition - 1)
    }
    func getSumQuestionText(_ index: Int) -> String {
        return "\(amountsOfWin[index]) \(checkLastQuestion(index))"
    }
    private func checkLastQuestion(_ index: Int) -> String{
        if(index == amountsOfWin.count - 1){
            return ""
        } else {
            return "RUB"
        }
    }

    func countQustion() -> Int {
        return amountsOfWin.count
    }
    
    func getWinSumm() -> String {
        if currentPosition == 0 {
            return "0 Rub"
        }
        if currentPosition == amountsOfWin.count && lastAnswerIndex == getActiveQuestion().rightAnswerIndex {
            return getSumQuestionText(currentPosition - 1)
        }
        if winPosition > 0 {
            return getSumQuestionText(winPosition - 1)
        }
        
        winPosition = currentPosition
        repeat {
            winPosition-=1
            if winPosition == 0 {
               return "0 Rub"
            }
        } while !checkPointPosition.contains(winPosition)
        return getSumQuestionText(winPosition - 1)
    }
    
    func isWin() ->Bool {
        return true
    }
}
