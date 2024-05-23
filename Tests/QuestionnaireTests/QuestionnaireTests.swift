import XCTest
@testable import Questionnaire

final class sdkTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest
        let questionnaire = Questionnaire.Builder(apiKey: "", vc: UIViewController.init())
            .build()
        

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}
