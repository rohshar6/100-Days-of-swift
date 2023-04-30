import Cocoa

class Test<T> {
    init() {
        print("i m being initialized!")
    }
}

let obj = Test<NSView>()

protocol AddOperation {
    static func +(_ l: Self, _r: Self) -> Self
}

extension Int: AddOperation {}
extension String: AddOperation {}

func addOp<T:AddOperation>(_ a: T, _ b: T) -> T {
    return a + b
}

print(addOp(2, 3))
print(addOp("hey", " rohit"))


// optionals
enum OptionalValue<T>: ExpressibleByNilLiteral {
    case some(T)
    case none
    
    init(nilLiteral: ()) {
        self = .none
    }
    
    init(_ some: T) {
        self = .some(some)
    }
}


func filter<T>(_ collection: [T], _ isIncluded: (T) -> Bool) -> [T] {
    var result: [T] = []
    for element in collection {
        if isIncluded(element) {
            result.append(element)
        }
    }
    return result
}
