import UIKit
import Foundation

var str = "Hello, playground"

let a = atan(Double(9)) * 180 / .pi

func singBeerSong(times: Int = 99) {
    if times <= 0 {return}
    print("There's \(times) bottles of beer on the wall, \(times) bottles of beer\nTake one down, pass it around, \(times - 1) bottles of beer on the wall")
    return singBeerSong(times: times - 1)
}
//singBeerSong()

func inArray(_ a1: [String], _ a2: [String]) -> [String] {
  var answer = [String]()
    for sub1 in a1 {
    var contained = false
      for word in a2 {
          if word.contains(sub1) {
            contained = true
            continue
            }
        }
        if contained {
          answer.append(sub1)
          }
    }
    return answer
}

let a1 = ["arp", "live", "strong"]
let a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
inArray(a1, a2)

class Queue<T> {
     var array = [T]()
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    func enqueue(element: T) {
        array.append(element)
    }
    func dequeue() -> T? {
        if isEmpty() {
            return nil
        } else {
           return array.remove(at: 0)
        }
    }
    func peek() -> T? {
        return array.first
    }
    func count() -> Int {
        return array.count
    }
}

func getSpiders(n:Int,x:Int,spiders:[Int]) -> [Int] {
    var answer = [Int]()
    var count = 1
    let initialQ = Queue<(power:Int,spider:Int)>()
    
    
    for i in spiders {
        initialQ.enqueue(element: (power: count, spider: i))
        count += 1
    }
    count = x
    while answer.count < x {
        print("answer:\(answer.count)")
        print("answer:\(answer)")
        
        print(count)
        var max = 0
        let holdQ = Queue<(power:Int,spider:Int)>()
        print(initialQ.array)
        
        for _ in 1...count {
            if let temp = initialQ.dequeue() {
                holdQ.enqueue(element: temp)
                if temp.spider >= max {
                    max = temp.spider
                }
            }
        }
        print("hold:\(holdQ.array)")
        print("max:\(max)")
        if max == 0 {
            if let temp3 = holdQ.dequeue() {
                answer.append(temp3.power)
            }
            for _ in 1..<count  {
                if let temp2 = holdQ.dequeue() {
                    if temp2.spider == 0 {
                        initialQ.enqueue(element: (power: temp2.power, spider: 0))
                    } else {
                        initialQ.enqueue(element: (power: temp2.power, spider: temp2.spider - 1))
                    }
                    
                }
            }
            continue
        }
        var changed = false
        for _ in 1...count  {
            if let temp2 = holdQ.dequeue() {
                if temp2.spider == max, changed == false {
                    answer.append(temp2.power)
                    changed = true
                    continue
                }
                if temp2.spider == 0 {
                    initialQ.enqueue(element: (power: temp2.power, spider: 0))
                } else {
                    initialQ.enqueue(element: (power: temp2.power, spider: temp2.spider - 1))
                }
                continue
                
            }
        }
        //count -= 1
    }
    return answer
}

getSpiders(n: 6, x: 5, spiders: [1,2,2,3,4,5])

var array = [String]()
array.map {
    $0.components(separatedBy: ",")
}
let setArray = Set(array)
array = Array(setArray)

func categorySuggestions(categories: [String], projects: [String], k: Int) -> [[String]] {
    let separatedCategories: [(String,String,Double)] = categories.map {
        let categoryCategoryRelevance = $0.components(separatedBy: ",")
        if let relevance = Double(categoryCategoryRelevance[2]) {
            return (categoryCategoryRelevance[0],categoryCategoryRelevance[1],relevance)
        }
        return (categoryCategoryRelevance[0],categoryCategoryRelevance[1],0)
    }

    var currentSuggestions = [[(String,Double)]]()
    var categoryToRelevance: [(String,Double)] = []
    for project in projects {
        categoryToRelevance.append((project,1.0))
        for ccr in separatedCategories {
                if project == ccr.0 {
                    categoryToRelevance.append((ccr.1,ccr.2))
                } else if project == ccr.1 {
                    categoryToRelevance.append((ccr.0,ccr.2))
                }
            }
            currentSuggestions.append(categoryToRelevance)
    }
        
    var sortedSuggestions = [[(String,Double)]]()
    for suggestion in currentSuggestions {
        let sorted = suggestion.sorted { (first: (String,Double), second: (String,Double)) -> Bool in
        if first.1 == second.1 {
            return first.0 > second.0
        }
        return first.1 < second.1
        }
        let filtered = sorted.filter { (a:(String,Double)) -> Bool in
            a.1 != 0.0
        }
        sortedSuggestions.append(filtered)
    }
    
    print(sortedSuggestions)
    var relevantSuggestions = [[String]]()
    for cr in sortedSuggestions {
        var shadowCr = cr
        var kSuggestions: [String] = []
        while  kSuggestions.count < k {
            if let category = shadowCr.popLast() {
                if !kSuggestions.contains(category.0) {
                    kSuggestions.append(category.0)
                }
            } else {
                break
            }
        }
        relevantSuggestions.append(kSuggestions)
    }
    return relevantSuggestions
}

//var sample = [(String,Double)]()
//sample.contains { (<#(String, Double)#>) -> Bool in
//    <#code#>
//}
