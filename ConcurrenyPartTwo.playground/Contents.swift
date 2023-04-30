import Cocoa

// Fetch multiple images concurrently

///This approach starts with a call to a global function; it will be one of these of Task:
    /// - • withTaskGroup(of:returning:body:)
    /// - • withThrowingTaskGroup(of:returning:body:)
func fetchManyURLs() async throws -> [Data] {
    let urls: [URL] = []
    var result = [Data]()
    // ???
    return result
}
