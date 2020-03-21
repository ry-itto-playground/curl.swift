import ArgumentParser

struct CurlCommand: ParsableCommand {

    static var configuration: CommandConfiguration = .init(
        commandName: "curl-swift",
        abstract: "transfer a URL",
        discussion: "")

    @Argument(help: "URL")
    var url: String

    @Option(
        name: .customShort(Character("X")),
        default: .get,
        help: "HTTP method")
    var method: HTTPMethod

    @Option(
        name: .shortAndLong,
        default: nil,
        help: "Output file path")
    var output: String?

    @Option(
        name: .shortAndLong,
        default: nil,
        help: "HTTP POST data")
    var data: String?

    func validate() throws {
        guard url.isURL else {
            throw ValidationError("Please input valid url")
        }
    }
}
