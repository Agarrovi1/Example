import Foundation

struct Stack<T> {
    
    private var arr = Array<T>()
    
    mutating func pop() -> T? {
        return arr.popLast()
    }
    
    mutating func push(element: T) {
        arr.append(element)
    }
    
    func peek() -> T? {
        guard arr.count > 0 else {
            return nil
        }
        return arr[arr.count - 1]
    }
    
    func isEmpty() -> Bool {
        return arr.count == 0
    }
}

