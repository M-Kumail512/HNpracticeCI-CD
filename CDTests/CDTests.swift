//
//  CDTests.swift
//  CDTests
//
//  Created by Mac Pro on 22/04/2025.
//

import XCTest
@testable import CD

final class CDTests: XCTestCase {

    var viewController: ViewController!
    
    override func setUpWithError() throws {
        // Initialize the ViewController instance before each test
        viewController = ViewController()
        // Load the view hierarchy to simulate the app environment
        _ = viewController.view
    }
    
    override func tearDownWithError() throws {
        // Clean up after the test
        viewController = nil
    }
    
    func testSumAndPrint() {
        // Test the sum calculation directly
        let result = viewController.sumAndPrint()
        XCTAssertEqual(result, 15, "The sum should be 15")
    }

}
