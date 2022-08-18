import Cocoa

var greeting = "Hello, playground"

//When we have a known finite number of subtasks to perform, Swift structured con‐currency provides a simple, elegant syntax: async let. Here’s a rewrite of fetchTwo-URLs that uses async let:
func download(url: URL) async -> Data {
    print(url);
    
    return Data()
}

func fetchTwoURLs() async throws -> (Data, Data) {
    let url1 = URL(string:"https://www.apeth.com/pep/manny.jpg")!
    let url2 = URL(string:"https://www.apeth.com/pep/moe.jpg")!
    async let data1 = download(url: url1)
    async let data2 = download(url: url2)
    return (try await data1, try await data2)
}

func test() async throws {
    let url1 = URL(string:"https://www.apeth.com/pep/manny.jpg")!
    let url2 = URL(string:"https://www.apeth.com/pep/moe.jpg")!
    
    async let d1 = { () async throws -> Data in
        let result = try await download(url: url1)
        return result
    }()
    async let d2 = { () async throws -> Data in
        let result = try await download(url: url2)
        return result
    }()
}
