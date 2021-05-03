import UIKit
import Foundation
var str = "Hello, playground"

var number = [1, 2, 3, 4]
var doubleNumbers = number.map { $0 * 2 }
print(doubleNumbers)

var sortedNumbers = doubleNumbers.sorted(by: {$0 > $1})
print(sortedNumbers)

var filteredNums = number.filter({(a) in a % 2 == 0})
print(filteredNums)

var seconds = 60
let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
    seconds -= 1
    print(seconds)
}
//func blah(num: Int) -> Int {
//
//}
