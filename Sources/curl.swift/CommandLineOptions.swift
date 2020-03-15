import ArgumentParser

struct CurlCommand: ParsableCommand {

    static var configuration: CommandConfiguration = .init(
        commandName: "curl-swift",
        abstract: "transfer a URL",
        discussion: "")

    @Argument(help: "URL")
    var url: String

    func validate() throws {
    }
}
