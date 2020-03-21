struct PrettyPrinter {
    static func printString<T: Hashable>(_ dictionary: Dictionary<T, Any>) -> String {
        return dictionary
            .map { "\u{001B}[34m\($0.key):\u{001B}[m \($0.value)" }
            .joined(separator: "\n")
    }
}
