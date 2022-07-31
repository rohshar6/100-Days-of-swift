import Cocoa

// MARK: - Where Clauses
// Generic function -> it appear after signature declaration
// Generic type -> appear after type declaration
// Generic protocol -> it comes across protocol declaration
// associated type -> end of associated type declaration

protocol Flier {}

// Base
//func flyAndWalk<T: Flier> (_ f: T) {}


// WITH Where
func flyAndWalk<T> (_ f: T) where T: Flier {}
print("test")

protocol Flocker {
    associatedtype T: Flier
}

protocol FlockerTwo {
    associatedtype T where T: Flier
}
print("test - 2")

// Good example

//1.
protocol FlierEx {
    associatedtype T
}

struct Bird: FlierEx, Equatable {
    typealias T = String
}

struct Insect: FlierEx {
    typealias T = Bird
}

func flockTogther<U>(_ f: U) where U: FlierEx, U.T: Equatable {
    print("Huraah!")
}


flockTogther(Bird())
flockTogther(Insect())
