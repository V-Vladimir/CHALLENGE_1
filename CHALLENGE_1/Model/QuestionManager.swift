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
    private var questions:[Question] = []
    private var currentPosition:Int = 1
    private var activeAnswer:[Int] = []
    //helper flags
    private var isMistake = false
    private var isFiftyAndFiftyActive = false
    private var isPeoplesHall = false
    
    init() {
        loadQuestions()
    }
    
    func reload() {
        questions = []
        loadQuestions()
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
        let question = getAciveQuestion()
        activeAnswer = Array(repeating: question.rightAnswerIndex, count: 2)
        repeat {
            activeAnswer[1] = Int.random(in: 0..<4)
        } while activeAnswer[1] == question.rightAnswerIndex
        return activeAnswer
    }
    
    func checkAnswer(_ index:Int) -> Bool {
        return (index == getAciveQuestion().rightAnswerIndex) ? true : false
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
    
    func getAciveQuestion() -> Question {
        return questions[currentPosition]
    }
    
    func getPosition() -> Int {
        return currentPosition
    }
    
    func nextQuestion() -> Question {
        currentPosition+=1
        activeAnswer = []
        return getAciveQuestion()
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
    
}
