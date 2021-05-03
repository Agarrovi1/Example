//
//  MultiplechoiceModel.swift
//  Kwiz
//
//  Created by EricM on 1/28/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation

struct MultipleChoiceQuestion: Question {
    struct Answer: Equatable {
        static func == (lhs: Answer, rhs: Answer) -> Bool { lhs.text == rhs.text }
        private(set) var text: String
    }
    let questionText: String
    let allAnswers: [Answer]
    let correctAnswer: Answer
    let points: Int
}

class MultiplechoiceViewModel {
    let question: MultipleChoiceQuestion
    var answers: [MultipleChoiceQuestion.Answer]
    
    init (question: MultipleChoiceQuestion){
        self.question = question
        answers = question.allAnswers
    }
    
    func readQuestion() -> String {
        print(question)
        return question.questionText
//        for a in allAnswers {
//            print(a.getText())
//        }
    }
    func getAnswerTexts() -> [String] {
        return answers.map { $0.text }
//        var texts = [String]()
//        for a in question.allAnswers {
//            texts.append(a.text)
//        }
//        return texts
    }
    func shuffleAnswers() {
        answers.shuffle()
    }
    
    /// find Answer for [answer]
    /// switch on correctness of Answer
    /// - Parameter answer: takes in 0 - number of answers
    /// - Returns: true if right or false if not
    func guess(answer: Int) -> Bool {
        guard answer <= question.allAnswers.count - 1 else { return false }
        let chosen = question.allAnswers[answer]
        if chosen == question.correctAnswer {
            return true
        } else {
            return false
        }
    }
}
