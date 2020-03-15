import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(curl_swiftTests.allTests),
    ]
}
#endif
