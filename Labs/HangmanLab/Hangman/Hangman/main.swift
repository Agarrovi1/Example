
//
//  main.swift
//  Hangman-Project
//
//  Created by Angela Garrovillas on 7/12/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

var chosenWord = allTheWords.randomElement()

func guessLetter() -> Character? {
    print("guess a letter:", terminator: " ")
    let guess = readLine()
    return guess?.first
}



let hangmanFinal = """
____
|   O
|  \\|/
|   |
|  / \\
__|__

"""
let hangmanStrikeOne = """
____
|   O
|
|
|
__|__
"""
let hangmanStrikeTwo = """
____
|   O
|   |
|   |
|
__|__
"""
let hangmanStrikeThree = """
____
|   O
|  \\|
|   |
|
__|__
"""
let hangmanStrikeFour = """
____
|   O
|  \\|/
|   |
|
__|__
"""
let hangmanStrikeFive = """
____
|   O
|  \\|/
|   |
|  /
__|__
"""
let hangmanAtStart = """
____
|
|
|
|
__|__
"""
var dictForStrikes = [0:hangmanAtStart,1:hangmanStrikeOne,2:hangmanStrikeTwo,3:hangmanStrikeThree,4:hangmanStrikeFour,5:hangmanStrikeFive,6:hangmanFinal]

func currentHangmanStatus(strike: Int) -> String {
    var current = ""
    for (a,b) in dictForStrikes {
        if a == strike {
            current = b
        }
    }
    return current
}

func printTheWord(word: String?) -> String {
    var blank = ""
    if let wordReal = word {
        for _ in wordReal {
            blank = blank + "_ "
        }
    }
    return blank
}

let wordInBegin = printTheWord(word: chosenWord)

func blanksAndLetters(word: String?, guesses: [Character?]) -> String {
    var answer = ""
    var theWord: [Character] = []
    var realGuess: [Character] = []
    if let real = word {
        for a in real {
            theWord.append(a)
        }
    }
    
    for a in guesses {
        if let real = a {
            realGuess.append(real)
        }
    }
    
    for a in theWord {
        if realGuess.contains(a) {
            answer = answer + "\(a) "
        } else {
            answer = answer + "_ "
        }
    }
    
    return answer
}


func isGuessRightOrWrong(guess: Character?, word: String?) -> Bool {
    if let unwrappedChosen = word {
        if let unwrappedGuess = guess {
            if unwrappedChosen.contains(unwrappedGuess) {
                return true
            } else {
                return false
            }
        }
    }
    return false
}

func resultOfGame() -> String? {
    print("Want to try again? yes or no:", terminator: " ")
    let answer = readLine()
    return answer
}

func gameStart() -> String? {
    let wordForGame = chosenWord
    var strikes = 0
    var allGuesses: [Character?] = []
    print("Hangman Game Start!")
    print(hangmanAtStart)
    print(wordInBegin)
    while strikes < 6 {
        let input = guessLetter()
        var currentWord = blanksAndLetters(word: wordForGame, guesses: allGuesses)
        var currentHangman = currentHangmanStatus(strike: strikes)
        
        if isGuessRightOrWrong(guess: input, word: wordForGame) {
            print("Right")
            allGuesses.append(input)
        } else {
            print("Wrong")
            allGuesses.append(input)
            strikes += 1
        }
        currentWord = blanksAndLetters(word: wordForGame, guesses: allGuesses)
        currentHangman = currentHangmanStatus(strike: strikes)
        if !currentWord.contains("_") {
            print("you Won")
            let tryAgain = resultOfGame()
            if tryAgain == "yes" {
                gameStart()
            } else {
                return "You Won"
            }
        }
        print(currentHangman)
        print(currentWord)
        print(allGuesses)
        print("Strikes: \(strikes)")
        continue
    }
    
    print(hangmanFinal)
    print("Game Over")
    print("The word was \(String(describing: wordForGame))")
    let tryAgain = resultOfGame()
    if tryAgain == "yes" {
        gameStart()
    }
    return "Game Over"
}

gameStart()


