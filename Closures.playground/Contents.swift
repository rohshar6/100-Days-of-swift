import Cocoa
import AppKit
import Foundation

var greeting = "Hello, playground"

func normalFunc() {
    print("I m normal")
}

typealias closures = () -> ()
var closureFunctionNormal: () -> ()


func secondFunc(closure: @escaping closures) {
    print("second func")
    
    closure()
}

// medium link for ref: https://medium.com/swiftcommmunity/what-do-mean-escaping-and-nonescaping-closures-in-swift-d404d721f39d

// non-escaping closures
func testFuncMe(closure: closures) {
   // do task
   // run closure that's it
    closure()
}

testFuncMe {
    print("non-escaping closure")
}

// escaping closuee
func testEscapingClosure(closure: @escaping closures) {
   // do task
   // func completes
   // closure escapes into the memory
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        closure()
    }
    
    print("test escaping function ran.")
}

testEscapingClosure {
    print("escaping closures")
}



class TestMe {
    var myValue = "very high"
    func thirdFunc(closure: (String) -> (Int)) {
        closure("test me")
    }
    
    deinit {
        print("memory removed")
    }
    
    func run() {
        thirdFunc { value in
            print(value, self.myValue)
            print("closure 3")
            return 2
        }
    }
    
}



//weak vs unowned

// - unowned
// Just like an implicitly unwrapped optional, If you can guarantee that the reference will not be nil at its point of use, use unowned. If not, then you should be using weak.
// Unowned references, like weak references, do not increase the retain count of the object being referred.
// However, in Swift, an unowned reference has the added benefit of not being an Optional. This makes them easier to manage rather than resorting to using optional binding.
// This means that when the object is deallocated, it does not zero out the pointer. This means that use of unowned references can, in some cases, lead to dangling pointers. For you nerds out there that remember the Objective-C days like I do, unowned references map to unsafe_unretained references.

// The only difference between unowned and weak, is performance. Since unowned has no checking, it is faster. There is absolutely no other difference.


// iterator pattern

struct MenuItem {}
protocol IteratorProtocol: AnyObject {
    func next() -> MenuItem
    func hasNext() -> Bool
    func remove()
    func makeIterator() -> IteratorProtocol
}

class AlternatingDinerMenuIterator: IteratorProtocol {
    var menuItems = [MenuItem]()
    var position = 0;
    
    init(menuItem: [MenuItem]) {
        self.menuItems = menuItem
        self.position = Calendar.current.firstWeekday % 2
    }
    
    func next() -> MenuItem {
        let val = menuItems[position]
        position = position + 2
        return val
    }
    
    func hasNext() -> Bool {
        if position < menuItems.count || position > 0 {
            return true
        }
        
        return false
    }
    
    func remove() {
        fatalError("no function for remove")
    }
    
    func makeIterator() -> IteratorProtocol {
        return self
    }
}

//closure syntax
//{ (paramters) -> (return type) in
//
//}


func testClosure() -> (Int) -> (String) {
    
    let test = { (num: Int) -> (String) in
        return "rohit"
    }
    return test
}


let closure = testClosure()
closure(2)
