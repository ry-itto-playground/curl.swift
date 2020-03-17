import ArgumentParser

enum HTTPMethod: ExpressibleByArgument {
    case get
    case post
    case put
    case delete

    init?(argument: String) {
        switch argument.lowercased() {
        case "get":
            self = .get
        case "post":
            self = .post
        case "put":
            self = .put
        case "delete":
            self = .delete
        default:
            return nil
        }
    }
}
