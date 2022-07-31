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
