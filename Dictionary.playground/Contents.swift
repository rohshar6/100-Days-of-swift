import Cocoa

var dictionary: [String : String] = [:]

// Example 1
print("hello")
// let d = Dictionary(grouping: states) {$0.prefix(1).uppercased()}

dictionary.updateValue("", forKey: "") // -api
dictionary.removeValue(forKey: "") // api - 2

for object in dictionary {
    print(object.key)
    print(object.value)
}

dictionary.forEach { (key: String, value: String) in
    print("\(key) and \(value)")
}
