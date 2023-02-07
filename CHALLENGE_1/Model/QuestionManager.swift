//
//  QuestionManager.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 07.02.2023.
//

import Foundation

final class CQuestions {
    private var questions:[Question] = []
    private var isMistake = false
    private var currentPosition:Int = 1
    
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
        let question = getAciveQuestion()
        var arrayAnswerIndex = Array(repeating: question.rightAnswerIndex, count: 2)
        repeat {
            arrayAnswerIndex[1] = Int.random(in: 0..<4)
        } while arrayAnswerIndex[1] != arrayAnswerIndex[0]
        return arrayAnswerIndex
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
        return getAciveQuestion()
    }
    
    func isMakeMistake() -> Bool {
        return isMistake
    }
    
}
