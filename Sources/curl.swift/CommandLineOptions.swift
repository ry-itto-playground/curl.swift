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
    var method: HTTPMethod?

    func validate() throws {
    }
}
