import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  [
    testCase(ChineseTranditionalMusicCoreTests.allTests),
  ]
}
#endif
