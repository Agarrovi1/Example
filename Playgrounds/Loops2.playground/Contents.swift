import UIKit

var str = "Hello, playground"

var lives = 5
var points = 50

while lives > 0 {
    if points == 50 {
        print("yay")
        break
    }
    if lives > 3 {
        points += 30
    }
    print("you were hit! -1")
    lives -= 1
    points += 5
}
//q17
for i in 1...10 {
    if (i >= 4 && i <= 7){
        continue
    }
    print(i)
}
//
var myNum = 8

for number in 4..<8{
    if number == 7 {
        break
    } else {
        myNum += number
    }
}

print(myNum)


//for _ in 1...10{
//    for _ in 1...10{
//        print("Nesting!")
//    }
//}

for i in 1...10 {
    if (i >= 4 && i <= 7){
        break
    }
    print(i)
}

//outerloop: for x in 1...3 {
//    innerloop: for y in 1...3 {
//        if y == 2{
//            continue outerloop
//        }
//        print("x = \(x), y = \(y)")
//    }
//}

for x in 0...10 {
    for y in 0...10 where x - y >= 5 || y - x >= 5 {
    print("(\(x),\(y))")
    }
}

var n = 5
n = 1
while n < 6 {
    print(n * n)
    n += 1
}
n = 3
for x in 1...n {
    for y in 1...n {
        print("*", separator: "", terminator: " ")
    }
    print("")
}
