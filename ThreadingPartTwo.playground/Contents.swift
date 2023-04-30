import UIKit

class ThreadingClass {
    
    func testSyncQueue() {
        
        print("started q1")
        let queue = DispatchQueue(label: "my.queue.one")
        
        print("started q2")
        
        queue.sync {
            print("started q3")
            // time task ho rha h
            // sleep(4)
        }
        
        print("started q4")
    }
}

let thread = ThreadingClass()
thread.testSyncQueue()


// Make two task in sync : - Using GCD - Grand Central Dispatch
class TestSyncThreading {
    func testSyncingTogether() {
        let q1 = DispatchQueue(label: "my.q1.one")
        q1.sync {
            print("syncing started for q1 for long task")
            sleep(3)
        }
        
        let q2 = DispatchQueue(label: "my.q2.two")
        q2.async {
            print("syncing started for q2 for long task")
        }
    }
}

//let testThread = TestSyncThreading()
//testThread.testSyncingTogether()

// Make two task in async : - Using GCD - Grand Central Dispatch
class TestASyncThreading {
    func testSyncingTogether() {
        let q1 = DispatchQueue(label: "my.q1.one")
        q1.async {
            print("asyncing started for q1 for long task", Thread.isMainThread)
            sleep(4)
        }
        
        print("running another task!", Thread.isMainThread)
        
        let q2 = DispatchQueue(label: "my.q2.two")
        q2.async {
            print("asyncing started for q2 for long task", Thread.isMainThread)
        }
    }
}

let testThread = TestASyncThreading()
testThread.testSyncingTogether()
