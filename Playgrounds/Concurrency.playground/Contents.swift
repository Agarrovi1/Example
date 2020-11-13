import UIKit
import Foundation

var str = "Hello, playground"
//print(1)
//print(2)
//same queue,same

//instance of dispatch queue
//singleton pattern
//handles UI
//DispatchQueue.main.async {
//    print(3) //does this after it finished operations in .main
//}
//print(4)

//for _ in 0...10 {
//    print(1)
//    DispatchQueue.global().async {
//        print(3) //global gets called sometimes, on a different thread
//    }
//    print(2)
//}


// in order, in sync order

//DispatchQueue.global(qos: .userInitiated).sync {
//    print("i'm in user initiated")
//}
//
//DispatchQueue.global(qos: .utility).sync {
//    print("i'm in utility")
//}
//
//DispatchQueue.global().sync {
//    print("i'm in user global")
//}
//---------------------

//might not always print out in this order of priority
DispatchQueue.global(qos: .userInitiated).async {
    print("a i'm in user initiated") //second priority
}

DispatchQueue.global(qos: .utility).async {
    print("a i'm in utility") // later priority
}

DispatchQueue.global().async {
    print("a i'm in user global") //higher priority
}
