import Cocoa

// Associated Type helps in conforming to Flier & we don't have to typecast in compile type
protocol Flier {
    func fly()
}

protocol Flocker {
    associatedtype T: Flier
    func flockTogetherWith(f: T)
}

struct Bee: Flier {
    var birdy: String = ""
    func fly() {}
}

struct Bird: Flocker {
    func flockTogetherWith(f: Bee) {}
}

// Explicit specialization

// Generic protocol with associated type
protocol FlierPartTwo {
    associatedtype T
}

struct BirdPartTwo: FlierPartTwo {
    typealias T = String
}


// Generic object type
class Dog<T> {
    var name: T?
}

let d = Dog<String>()
d.name = "my doggy"

print(d.name ?? "")

// factory pattern
protocol FlierThree {
    init()
}

class BirdThree: FlierThree {
    var extra: String
    required init() {
        extra = ""
    }
    convenience init(name: String) {
        self.init()
        self.extra = name
    }
}

class BirdChild: BirdThree {
    func tester() {
        print("yes!")
    }
}
struct FlierMaker<T: FlierThree> {
    static func makeFlier() -> T {
        return T()
    }
}

let birdy = FlierMaker<BirdChild>.makeFlier()
birdy.tester()




