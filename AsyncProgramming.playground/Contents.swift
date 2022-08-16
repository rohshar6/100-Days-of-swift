import Cocoa

var greeting = "Hello, playground"

typealias hanlder = ((Data) -> ())
var completionHanlder: hanlder


func download(completionHanlder: @escaping hanlder) {
    // do something
    print("hey! there!")
    completionHanlder(Data())
}


download { data in
    print("hey!")
}

func download(url: URL) async throws -> Data {
    let result = try await URLSession.shared.data(from: url)
    return result.0 // the data
}

