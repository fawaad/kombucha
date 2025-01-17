#if !canImport(ObjectiveC)
import XCTest

extension JSONCheckTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__JSONCheckTests = [
        ("testCheckArrayConsistencyFails", testCheckArrayConsistencyFails),
        ("testCheckEmptyArrayFails", testCheckEmptyArrayFails),
        ("testCheckEmptyArraySucceeds", testCheckEmptyArraySucceeds),
        ("testCheckEmptyObjectFails", testCheckEmptyObjectFails),
        ("testCheckEmptyObjectSucceeds", testCheckEmptyObjectSucceeds),
        ("testCheckFlagNewKeysFails", testCheckFlagNewKeysFails),
        ("testCheckFlagNewKeysSucceeds", testCheckFlagNewKeysSucceeds),
        ("testCheckStringBoolFails", testCheckStringBoolFails),
        ("testCheckStringBoolSucceeds", testCheckStringBoolSucceeds),
        ("testCheckStringNumberSucceeds", testCheckStringNumberSucceeds),
        ("testCheckStructureAndArraysSeveralErrorsAndWarnings", testCheckStructureAndArraysSeveralErrorsAndWarnings),
        ("testCheckStructureFails", testCheckStructureFails),
        ("testCheckStructureFailsWithProperContext", testCheckStructureFailsWithProperContext),
        ("testCheckStructurePasses", testCheckStructurePasses),
        ("testDefaultChecksTestArrayConsistencySucceeds", testDefaultChecksTestArrayConsistencySucceeds),
    ]
}

extension JSONValueAndPreludeTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__JSONValueAndPreludeTests = [
        ("testJSONValueFoldNested", testJSONValueFoldNested),
        ("testJSONValueFoldOneLevel", testJSONValueFoldOneLevel),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(JSONCheckTests.__allTests__JSONCheckTests),
        testCase(JSONValueAndPreludeTests.__allTests__JSONValueAndPreludeTests),
    ]
}
#endif
