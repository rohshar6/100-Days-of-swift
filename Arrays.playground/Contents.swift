import Cocoa
import Foundation

var elements = [1,2,3]

struct MyData {
    let value: Int
    let work: String = "test me"
}


var newElements = elements.map({
    MyData(value: $0)
})

newElements.forEach { ele in
    print(ele.value)
}

// flatmap() -> it just flattens the array - [[1,2], [3,4]]  -> [1,2,3,4]
// compactMap() -> it safely unwraps arrays of optionals and removes nil element from the array and returns array with non-optionals


let arr = [1, 4, 9, 13, 112]
let sum = arr.reduce(0) {$0 + $1} // 139
