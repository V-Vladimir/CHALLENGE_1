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
