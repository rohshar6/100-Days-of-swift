import UIKit

var greeting = "Hello, playground"

// medium: https://medium.com/@prasanna.aithal/multi-threading-in-ios-using-swift-82f3601f171c

// Part - 1
// main thread
// DispatchQueue.main.async { }

// PART - 2
class ThreadingClass {
    // create thread like this: way - 1
    lazy var thread = Thread(target: self, selector: #selector(threadFunction), object: self)
    let testValue = "Rohit"
    // create thread way - 2
    func runThreadTwo() {
        Thread.detachNewThreadSelector(#selector(threadFunction), toTarget: self, with: testValue)
    }
    
    @objc func threadFunction() {
        Thread.current.name = "Thread-Two"
        print("New Thread h Boss")
        print("current: \(Thread.current.name ?? ""), mainThread: \(Thread.main.name ?? "")")
        
        DispatchQueue.main.async {
            print("Yeh knse thread mei h")
            print("current: \(Thread.current.name ?? ""), mainThread: \(Thread.main.name ?? "")")
        }
    }
}


// My Own Thread
Thread.main.name = "main"
print("test me")

// class MyOwnThread: Thread {}
let threadObj = ThreadingClass()
threadObj.runThreadTwo()


// medium: https://medium.com/omarelgabrys-blog/threads-vs-queues-a71e8dc30156
// queues vs threading
// The tasks inside the queue not only can be persisted, monitored, and visualized but can also be used as an audit log to trace back what happened to the application, basically, a history of all the changes. This opens the gate for another pattern called “Event Sourcing”.

//let mainQueue = DispatchQueue.main
//let concurrentQueue = DispatchQueue(label: "com.test.concurrent", attributes: .concurrent)
//let serial = DispatchQueue(label: "com.test.serial")
//let queue = DispatchQueue(label: String, qos: DispatchQoS,attributes: DispatchQueue.Attributes,autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue?)
//let q = DispatchQueue(label: "com.test.q", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: )

func printCandies(){
  for i in 0..<3 {
     print("\(i) => Candy")
   }
}
func printApples(){
  for i in 0..<3 {
      print("\(i) => Apple")
   }
}
print("-->")
func serialQueueTest(){
   let queue = DispatchQueue(label: "com.knowstack.queue1")
   queue.async {
     print("current: \(Thread.current.name ?? ""), mainThread: \(Thread.main.name ?? "")")
     printApples()
   }
   queue.async {
     printCandies()
   }
}

serialQueueTest()

print(" --> ")

func globalQueueTest() {
    print("--> g")
   let globalQueue = DispatchQueue.global()
   globalQueue.async {
       print("current: \(Thread.current.name ?? ""), mainThread: \(Thread.main.name ?? "")")
       printCandies()
   }
    print("-->")
   globalQueue.async {
      printApples()
   }
   globalQueue.async {
      printCandies()
   }
}

globalQueueTest()   
// GCD: https://medium.com/hackernoon/swift-multi-threading-using-gcd-for-beginners-2581b7aa21cb
