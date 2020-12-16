import UIKit

var str = "Hello, playground"

"ab".hashValue
"ba".hashValue
"aaa".hashValue

struct NewThing: Hashable {
    let a: Int
    let b: Int
    let myDict = [Int:Int]()
    let data: Data? //data is hashable
}

let myThing = NewThing(a: 8, b: 9, data: nil)
myThing.hashValue

struct HashTable<Key: Hashable, Value> {
    //Hashable -- should be something that can be turned into a number
    typealias Element = (key:Key,value:Value)
    
    public subscript(key: Key) -> Value? {
        //can use hashTable[] just like a dictionary
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                update(value: value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
    
    func value(forKey key: Key) -> Value? {
        //gets
        let arrIndex = index(of: key)
        let bucket = arr[arrIndex]
        for element in bucket {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    mutating func update(value newValue: Value, forKey key: Key) -> Value? {
        //updates a value gives back old value or nil if there wasn't any
        let arrIndex = index(of: key)
        for (bucketIndex, element) in arr[arrIndex].enumerated() {
            if element.key == key {
                let oldValue = arr[arrIndex][bucketIndex].value
                arr[arrIndex][bucketIndex].value = newValue
                return oldValue
            }
        }
        arr[arrIndex].append((key,newValue))
        return nil
    }
    
    mutating func removeValue(forKey key: Key) -> Value? {
        //remove from bucket if its there
        let arrIndex = index(of: key)
        for (bucketIndex, element) in arr[arrIndex].enumerated() {
            if element.key == key {
                let removedThing = arr[arrIndex].remove(at: bucketIndex)
                return removedThing.value
            }
        }
        return nil
    }
    
    private var arr = Array(repeating: [Element](), count: 10)
    private func index(of key: Key) -> Int {
        //takes in a key and spits out a value
        return abs(key.hashValue) % arr.count
    }
}

var myHashTable = HashTable<String,Int>()
//let myDict = Dictionary<String,Int>()

myHashTable["hello"] = 6
myHashTable["goodbye"] = 100

print (myHashTable)

print(myHashTable["hello"])
myHashTable["hello"] = 4
print(myHashTable["hello"])
myHashTable["hello"] = nil
print(myHashTable["hello"])

//new date object gets the time of when it runs
let myStartTime = Date()

var myArr: [Int] = []
myArr.capacity
//use as little space as possible until it is needed

for i in 0...2 {
    myArr.append(i)
}

myArr.capacity
