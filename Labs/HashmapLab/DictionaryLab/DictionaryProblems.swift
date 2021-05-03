import Foundation

// Find the most frequently occurring character in a given string

func mostFrequentlyOccurringChar(in str: String) -> Character {
    var frequencyDict = [Character:Int]()
    for a in str {
        if let freq = frequencyDict[a] {
            frequencyDict[a] = freq + 1
        } else {
            frequencyDict[a] = 1
        }
    }
    var highestCount = 0
    var answer = Character(" ")
    for (key,value) in frequencyDict {
        if highestCount < value {
            answer = key
            highestCount = value
        }
    }
    return answer
}

// Find the first indicies whose values sum to a given number

func pairSum(arr: [Int], target: Int) -> (Int, Int) {
    var indexAndNum = [Int:Int]()
    for (index,value) in arr.enumerated() {
        indexAndNum[index] = value
    }
    for a in 0...arr.count - 1 {
        for (index,value) in indexAndNum {
            if a == index {
                continue
            }
            if arr[a] + value == target {
                return (a,index)
            }
        }
    }
    return (0, 0)
}

// Find the second most frequently occurring character in a given string

func secondMostFrequentlyOccurringChar(in str: String) -> Character {
    let mostFreqChar = mostFrequentlyOccurringChar(in: str)
    var frequencyDict = [Character:Int]()
    for a in str {
        if let freq = frequencyDict[a] {
            frequencyDict[a] = freq + 1
        } else {
            frequencyDict[a] = 1
        }
    }
    var secondHighestCount = 0
    var answer = Character(" ")
    for (char,freq) in frequencyDict {
        if char == mostFreqChar {
            continue
        }
        if secondHighestCount < freq {
            answer = char
            secondHighestCount = freq
        }
        
    }
    
    return answer
}

// https://leetcode.com/problems/ransom-note/

// Given an arbitrary ransom note string and another string containing letters from all
// the magazines, write a function that will return true if the ransom note can be
// constructed from the magazines ; otherwise, it will return false.

// Each letter in the magazine string can only be used once in your ransom note.

// Submit to the leetcode link for more tests

func canConstruct(note: String, from originalLetters: String) -> Bool {
    var magazineDict = [Character:Int]()
    for a in originalLetters {
        if let freq = magazineDict[a] {
            magazineDict[a] = freq + 1
        } else {
            magazineDict[a] = 1
        }
    }
    
    var neededDict = [Character:Int]()
    for a in note {
        if let freq = neededDict[a] {
            neededDict[a] = freq + 1
        } else {
            neededDict[a] = 1
        }
    }
    
    for (char, freq) in neededDict {
        if let magFreq = magazineDict[char] {
            if magFreq < freq {
                return false
            }
        } else {
            return false
        }
    }
    return true
}


// Return whether or not an input array contains duplicates

func containsDuplicates(arr: [Int]) -> Bool {
    var frequencyDict = [Int:Int]()
    for a in arr {
        if let freq = frequencyDict[a] {
            frequencyDict[a] = freq + 1
        } else {
            frequencyDict[a] = 1
        }
    }
    for value in frequencyDict.values {
        if value > 1 {
            return true
        }
    }
    return false
}

// Find all values that appear exactly once in a given array of Strings

func uniqueValues(in arr: [String]) -> [String] {
    var frequencyDict = [String:Int]()
    var answerArr = arr
    for a in arr {
        if let freq = frequencyDict[a] {
            frequencyDict[a] = freq + 1
        } else {
            frequencyDict[a] = 1
        }
    }
    for (str,freq) in frequencyDict {
        if freq == 1 {
            
        } else {
            answerArr = answerArr.filter({$0 != str})
        }
    }
    return answerArr
}

// Sort a given array by how often each term appears

func sortByFrequency(arr: [Int]) -> [Int] {
    var frequencyDict = [Int:Int]()
    for a in arr {
        if let freq = frequencyDict[a] {
            frequencyDict[a] = freq + 1
        } else {
            frequencyDict[a] = 1
        }
    }
    var freqArr = [Int]()
    for (_, freq) in frequencyDict {
        freqArr.append(freq)
    }
    freqArr.sort(by: {$0 > $1})
    var ansArr = [Int]()
    
    for a in freqArr {
        for (num, freq) in frequencyDict {
            if freq == a {
                for _ in 1...freq {
                    ansArr.append(num)
                }
            }
        }
    }
    return ansArr
}

