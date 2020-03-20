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

    func validate() throws {
    }
}
