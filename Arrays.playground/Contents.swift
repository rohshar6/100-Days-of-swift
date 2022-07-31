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
