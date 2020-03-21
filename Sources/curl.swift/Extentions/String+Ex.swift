import Foundation

extension String {
    var isURL: Bool {
        let linkValidation = NSTextCheckingResult.CheckingType.link.rawValue
        guard let detector = try? NSDataDetector(types: linkValidation) else { fatalError() }
        let results = detector.matches(in: self, options: .reportCompletion, range: NSMakeRange(0, self.count))
        return results.first?.url != nil
    }
}
