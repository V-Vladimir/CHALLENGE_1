//
//  Question.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 05.02.2023.
//

import Foundation

struct Question {
    let question: String
    let answers: [String]
    let rightAnswerIndex: Int
    init(_ question: String, _ wrongAnswers:[String], _ correctAnswer: String) {
        self.question = question
        var tmpAnswers: [String] = []
        for _ in wrongAnswers {
            tmpAnswers.append(wrongAnswers.randomElement() ?? "")
        }
        rightAnswerIndex = Int.random(in: 0..<4)
        tmpAnswers.insert(correctAnswer, at: rightAnswerIndex)
        answers = tmpAnswers
    }
}

struct JsonQuestion: Decodable {
    let level: Int
    let ask: String
    let correctAnswer: String
    let wrongAnswers: [String]
    
    static func questions() -> [JsonQuestion] {
        if let url = Bundle.main.url(forResource: "questions",
                                     withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let questions = try decoder.decode([JsonQuestion].self,
                                                   from: data)
                return questions
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}

class CQuestions {
    private var _questions = [Int: Question]()
    var currentPosition = 14
    init() {
        if true {
            var jsonData:[JsonQuestion] = []
            var dictionary = [Int: [JsonQuestion]]()
            jsonData = JsonQuestion.questions()
            for item in jsonData {
                if dictionary[item.level] == nil {
                    dictionary[item.level] = []
                }
                dictionary[item.level]?.append(item)
            }
            for (key, value) in dictionary {
                let jsonQuestion = value.randomElement()
                _questions[key] = Question(jsonQuestion!.ask,
                                           jsonQuestion!.wrongAnswers,
                                           jsonQuestion!.correctAnswer)
            }
        }

        assert(_questions.count == 15)
        for (_, item) in _questions {
            assert(item.answers.count == 4)
        }
    }
    
    func getPeoplePercent() -> [Int] {
        let correctAnswerIndex = _questions[currentPosition]!.rightAnswerIndex
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
    
    func getQuestion() -> Question {
        return _questions[currentPosition]!
    }
}
