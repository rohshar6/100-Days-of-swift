import Cocoa

var greeting = "Hello, playground"

actor TestActor {
    var data : String {
        return "pjbkjb"
    }
    
    public func getData() async -> String {
        return data
    }
}

print("l")

let q1 = DispatchQueue(label: "my.label.q1")
let actorD = TestActor()

Task {
    let d = await actorD.getData()
    print(d)
}
