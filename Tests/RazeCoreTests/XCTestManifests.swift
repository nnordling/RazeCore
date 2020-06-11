import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(RazeColorTests.allTests),
        XCTestCase(RazeNetworkingTests.allTests)
    ]
}
#endif
