import UIKit

func printSpiralOrder(matrix: [[Int]]) {
    var top = 0
    var left = 0
    var bottom = matrix.count - 1
    var right = matrix[0].count - 1
    
    while true {
        if left > right { break }
        //print top row (left to right) ->
        for i in left...right {
            print(matrix[top][i])
        }
        top += 1
        
        if top > bottom { break }
        //print right column (top to bottom) v
        for i in top...bottom {
            print(matrix[i][right])
        }
        right -= 1
        
        if left > right { break }
        //print bottom row (right to left) <-
        for i in stride(from: right, through: left, by: -1) {
            print(matrix[bottom][i])
        }
        bottom -= 1
        
        if top > bottom { break }
        //print left column (bottom to top) ^
        for i in stride(from: bottom, through: top, by: -1) {
            print(matrix[i][left])
        }
        left += 1
        
    }
}

let mat = [[1,2,3,4,5],[16,17,18,19,6],[15,24,25,20,7],[14,23,22,21,8],[13,12,11,10,9]]
//printSpiralOrder(matrix: mat)


func hourglassSum(matrix: [[Int]]) -> Int {
    var sum = 0
    var maxSum = Int.min
    
    for i in 0...matrix.count - 3 {
        for j in 0...matrix[i].count - 3 {
            sum += matrix[i][j]
            sum += matrix[i][j + 1]
            sum += matrix[i][j + 2]
            
            sum += matrix[i + 1][j + 1]
            
            sum += matrix[i + 2][j]
            sum += matrix[i + 2][j + 1]
            sum += matrix[i + 2][j + 2]
            
            if sum > maxSum {
                maxSum = sum
            }
            sum = 0
        }
        
        
    }
    return maxSum
}

let hour = [[-9, -9, -9,  1, 1, 1],
 [0, -9 , 0 , 4, 3, 2],
[-9 ,-9 ,-9,  1 ,2 ,3],
 [0 , 0 , 8 , 6, 6 ,0],
 [0 , 0 , 0, -2, 0, 0],
 [0 , 0,  1,  2 ,4, 0]]


//hourglassSum(matrix: hour)

func hackerCards(collection: [Int], d: Int) -> [Int] {
    var setId = Set(collection)
    var dRemaining = d
    var idBought = [Int]()
    for id in 1...d {
        if setId.contains(id) {
            continue
        }
        
        if dRemaining - id < 0 {
            return idBought
        }
        
        dRemaining -= id
        idBought.append(id)
        setId.insert(id)
    }
    return idBought
}

func countTeams(skills: [Int], minPlayers: Int, minLevel: Int, maxLevel: Int) -> Int {
    var skillsInRange = [Int]()
    
    for skill in skills {
        if skill >= minLevel && skill <= maxLevel {
            skillsInRange.append(skill)
        }
    }
    let availableSkill = skillsInRange.count
    var totalCombinations = 0
    if availableSkill < minPlayers {return 0}
    print(skillsInRange)
    for numberOfPlayers in minPlayers...availableSkill {
    let numerator = factorial(availableSkill)
    let denominator = factorial(numberOfPlayers) * (factorial(availableSkill - numberOfPlayers))
    let combinations = numerator / denominator
        totalCombinations += combinations
    }
    
    print(totalCombinations)
    return totalCombinations
}

func factorial(_ num: Int) -> Int {
    if num == 0 { return 1}
    return num * factorial(num - 1)
}
let test = [6,6,4,8,7,5,2]

//countTeams(skills: test, minPlayers: 2, minLevel: 3, maxLevel: 10)

/*
 Picking tickets
 Consider an array of n ticket prices, tickets. A number ,m, is defined as the size of some subsequence, s, of tickets where each element covers an unbroken range of integers. That is to say, if you were to sort the elements in s, the absolute difference between any elements j and j + 1 would be either 0 or 1. Determine the maximum length of a subsequence chosen from the tickets array
 
 Example
 tickets = [8,5,4,8,4]
 Valid subsequences, sorted, are  {4,4,5} and {8,8}. These subsequences have m values of 3 and 2, respectively. return 3
 
 Function Description
 Complete the function maxTickets in the editor below
 
 maxTickets has the following parameter(s): int tickets[n]: an array of integers
 
 Returns
 int: an integer that denotes the maximim possible value of m
 */

func maxTickets(tickets: [Int]) -> Int {
    let sortedTickets = tickets.sorted()
    var currentSize = 0
    var maxSize = Int.min
    
    for index in 0..<sortedTickets.count - 1 {
        let first = sortedTickets[index]
        let second = sortedTickets[index + 1]
        
        currentSize += 1
        
        if second - first > 1 {
            if currentSize > maxSize {
                print(currentSize)
                maxSize = currentSize
            }
            currentSize = 0
        }
    }
    
//    currentSize += 1
//    if currentSize > maxSize {
//        maxSize = currentSize
//    }
    
    return maxSize
}

let test2 = [5,10,12,1,10,4]

//maxTickets(tickets: test2)

/*
 8ppl
 4in a group
 = 5 possible groups
 
 no similar group [1,1,1,3][1,3,1,1]
 */


func possibleGroupsWithRepeats(people: Int, groups: Int) -> Int {
    if people > 0 && groups <= 0 {return 0}
        if people == 0 && groups <= 0 {return 1}
        if people <= 0 && groups > 0 {return 0}
        var count = 0
        for member in 1...people {
            if people - member >= 0 {
            count += possibleGroupsWithRepeats(people: people - member, groups: groups - 1)
            }
        }
    return count
}
func countMinusZeroes(arr: [Int]) -> Int {
    return arr.filter { $0 != 0 }.count
}
func possibleCombos(arr: [Int]? = nil, target: Int, min: Int,reducedNum: Int, index: Int) -> Int {
    guard var newArr = arr else {
        return possibleCombos(arr: Array.init(repeating: 0, count: target), target: target, min: min, reducedNum: reducedNum, index: index)
    }
    if reducedNum < 0 {return 0}
    
    if reducedNum == 0  {
        print(newArr)
        if countMinusZeroes(arr: newArr) == min {
            //print(newArr)
            return 1
        }
        return 0
    }
    let prev = index == 0 ? 1 : newArr[index - 1]
    var count = 0
    for number in prev...target {
        newArr[index] = number
        count += possibleCombos(arr: newArr, target: target, min: min, reducedNum: reducedNum - number, index: index + 1)
    }
    return count
}
func countOptions(people: Int, groups: Int) -> Int {
    let count = possibleGroupsWithRepeats(people: people, groups: groups)
return (count / groups) - 1
//    let numerator = factorial(people)
//    let denominator = factorial(people) * factorial(people - groups)
//    return numerator / denominator
}

//countOptions(people: 7, groups: 3) // 4
//possibleCombos(target: 7, min: 3, reducedNum: 7, index: 0)

func listSum(target: Int, arr: [Int], index: Int) -> [[Int]]  {
    if arr.count < 2 {
        return [arr]
    }

    if index < 1 {
        return []
    }
    var newArrOfArr = [[Int]]()
    
    for i in 1...index {
        var newArr = arr
        let last = newArr.remove(at: i)
        newArr[i - 1] = newArr[i - 1] + last
        newArrOfArr += listSum(target: target, arr: newArr, index: i - 1)
    }
    
    
    
    return [arr] + newArrOfArr
}
//print(listSum(target: 5, arr: [1,1,1,1,1], index: 4))
//var set = Set(listSum(target: 7, arr: [7]))
//print(set.filter {$0.count >= 3})


/*
 func listSum(target: Int, arr: [Int]) -> [[Int]]  {
     if target == 0 {
         return [arr]
     }
 //    if target < 0 {
 //        return []
 //    }
     
     var newArr = arr
     for index in 0...arr.count - 1 where arr[index] - 1 > 0 {
         newArr[index] = arr[index] - 1
         newArr.append(1)
     }
     
     return [arr] + [newArr] + listSum(target: target - 1, arr: newArr)
 }
 */

func splitSMS(_ sms: String) {
    var message = sms
    var counter = 0
    var splitText = ""
    var max = 160
    var output = [String]()
    while message.count > 0 {
        while counter < max {
            splitText.append(message.removeFirst())
            counter += 1
        }
        counter = 0
        var lastLetter = splitText.last ?? " "
        if lastLetter.isLetter {
            while lastLetter != " " {
                message.insert(splitText.removeLast(), at: message.startIndex)
                lastLetter = splitText.last ?? " "
            }
        }
        output.append(splitText)
        splitText.removeAll()
        if message.count < 160 {
            max = message.count
        }
    }
    var numOfMsgs = 0
    output.forEach { numOfMsgs += 1; print($0 + "(\(numOfMsgs)/\(output.count))\n") }
}
let text = "Jocelyn Enriquez (born December 28, 1974) is a Filipino-American dance-pop singer born and raised in the San Francisco Bay Area. Her most popular songs were \"Do You Miss Me\", \"A Little Bit of Ecstasy\", and the Stars on 54 (Ultra Nate, Amber, and Jocelyn Enriquez) cover of Gordon Lightfoot's \"If You Could Read My Mind\". Her success helped inspire and pave the way for many Asian American, particularly Filipino Americans from the San Francisco Bay Area, artists during the mid to late 1990's such as Buffy, Kai, One Vo1ce, Pinay, Sharyn Maceren, and others."
//splitSMS(text)

let textEx = """
Jocelyn Enriquez (born December 28, 1974) is a Filipino-American dance-pop singer born and raised in the San Francisco Bay Area. Her most popular songs were (1/4)
"""

print(textEx.count)
