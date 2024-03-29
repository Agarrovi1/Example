//
//  GameModel.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 2/6/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation
import GameKit
enum LivesRemaining: Int {
    case three = 3
    case two = 2
    case one = 1
}

protocol Question {
    var points: Int { get }
}

class Game {
    static let shared = Game()
    private var lives: LivesRemaining
    private var score: Int
    private var user: User?
    private var questions: [Question]
    private(set) var currentQuestion: Question?
    
    
    
    /// game requires user to exist, games always start with 3 lives and a score of 0
    /// - Parameter user: <#user description#>
    private init() {
        lives = LivesRemaining.three
        score = 0
        questions = Game.getQuestions()
    }
    
    //MARK: Questions
    /// internal game function to get questions
   static private func getQuestions() -> [Question] {
        return [
            LockQuestion(),
            ScaleQuestion(),
            
            MultipleChoiceQuestion(question: "What key can't open locks?", allAnswers: [Answer(text: "donkeys")
        ,Answer(text: "super keys")
        ,Answer(text: "falcon keys")
            ,Answer(text: "bit keys")],
       correctAnswer: Answer(text: "donkeys")
        , points: 5),
                
                MultipleChoiceQuestion(question: "What makes a vacuum good?", allAnswers: [Answer(text: "it sucks")
                ,Answer(text: "copacity")
                ,Answer(text: "dust devourer")
                ,Answer(text: "cleaner")],
                                       correctAnswer: Answer(text: "it sucks")
                , points: 5),
                MultipleChoiceQuestion(question: "I have 10 cookies and you took 5, what do you have?", allAnswers: [Answer(text: "a black eye and a broken hand")
                ,Answer(text: "5 cookies")
                ,Answer(text: "joy")
                ,Answer(text: "a sweet tooth")]
                    , correctAnswer: Answer(text: "a black eye and a broken hand")
                , points: 5),
    MultipleChoiceQuestion(question: "Where is the best place to hide something?", allAnswers: [Answer(text: "link to the second page in google")
    ,Answer(text: "in a forest")
    ,Answer(text: "your pocket")
    ,Answer(text: "plain sight")]
        , correctAnswer: Answer(text: "link to the second page in google")
    , points: 5),
    MultipleChoiceQuestion(question: "What is the most curious letter?", allAnswers: [Answer(text: "the letter Y")
    ,Answer(text: "the letter C")
    ,Answer(text: "a love letter")
    ,Answer(text: "the letter Q")]
        , correctAnswer: Answer(text: "the letter Y")
    , points: 5),
    MultipleChoiceQuestion(question: "You're in a dark cave with only one match, a lump of coal, a stove, and a kerosene lamp. You have the option of lighting one. Which do you light first?", allAnswers: [Answer(text: "the match")
    ,Answer(text: "the lump of coal")
    ,Answer(text: "the stove")
    ,Answer(text: "the kerosene lamp")],
                           correctAnswer: Answer(text: "the match")
    , points: 5),
    MultipleChoiceQuestion(question: "I have a head like a cat. I have feet like a cat, but I am not a cat. What am I?", allAnswers: [Answer(text: "a kitten")
    ,Answer(text: "a fox")
    ,Answer(text: "a mongoose")
        ,Answer(text: "a pokemon")], correctAnswer: Answer(text: "a kitten")
    , points: 5)]
    }
    
    func shuffle(){
        print("shuffle")
//        print("segue to multipleChoice VC")
        
        questions.shuffle()
//        getNewCurrentQuestion()
    }
    func getNewCurrentQuestion() {
        currentQuestion = questions.popLast()
    }
    func isQuestionsEmpty() -> Bool {
        return questions.isEmpty
    }
    
//    func getQuestionText() -> String {
//        if let question = currentQuestion {
//            return question.readQuestion()
//        } else {
//            return ""
//        }
//
//    }
//    func getAnswerTexts() -> [String] {
//        if let question = currentQuestion {
//            return question.getAnswerTexts()
//        } else {
//            return ["","","",""]
//        }
//    }
//    func answer(_ ans: Int) -> Bool {
//        print("answer picked")
//        if let question = currentQuestion {
//            if question.guess(answer: ans) {
//                increaseScore()
//                return true
//            } else {
//                switchOnLives()
//                return false
//            }
//        }
//        return false
//    }
    
    //MARK: User
    func setUser(user: User) {
        self.user = user
    }
    func reduceLives(){
        switchOnLives()
    }
    
    func start() {
        print("start/restart")
        lives = .three
        score = 0
        user?.startGame()
        user?.play()
    }
    
    //MARK: Game
    func quit(){
        print("quit")
        print("back to main view controller")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else {return}
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
                window.rootViewController = MainVC()
        }, completion: nil)
    }
    
    func timer(){
        print("timer")
    }
    
    func skip(){
        print("skip")
        //user?.nextQuestion()
    }
    
    
    private func switchOnLives() {
        switch lives {
        case .three:
            lives = .two
        case .two:
            lives = .one
        case .one:
            quit()
        }
    }
    func getLives() -> LivesRemaining {
        return lives
    }
    
    func increaseScore(){
        print("score")
        if let question = currentQuestion {
            score += question.points
            user!.updateHighScore(newCurrentScore: score)
        }
    }
    
    /// global game score
    /// - Returns: users score(Int)
    func getCurrentScore()-> Int {
        return user?.highestScore ?? 0
        //Show user score, current score
    }
    
    //MARK: GameCenter
    func checkFinishAchievement(){
        let totalQValue = Game.getQuestions().count * 5
        if(user!.highestScore >= totalQValue) {
            let achieved = GKAchievement(identifier: "kwiz.achievement.finished", player: GKLocalPlayer.local)
            achieved.percentComplete = 100
            achieved.showsCompletionBanner = true
            //GKAchievement.resetAchievements(completionHandler: nil)
            let achievementArr: [GKAchievement] = [achieved]
            GKAchievement.report(achievementArr, withCompletionHandler: nil)
        }
    }
    func saveScore(){
        if GKLocalPlayer.local.isAuthenticated {
            let scoreResponse = GKScore(leaderboardIdentifier: "kwiz.leaderboard.highscore")
            scoreResponse.value = Int64(score)
            let scoreArr: [GKScore] = [scoreResponse]
            GKScore.report(scoreArr, withCompletionHandler: nil)
        }
    }
}
