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
}

public class CQuestions {
    private var questions: [Question] = []
    init() {
        for numbers in 1...15 {
            questions.append(Question(question: "Question \(numbers)", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4"], rightAnswerIndex: 0))
        }
        assert(questions.count == 15)
        for item in questions {
            assert(item.answers.count == 4)
        }
    }
    public func returnAns() -> Int {
        return 13
    }
}
