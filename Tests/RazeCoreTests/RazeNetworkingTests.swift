//
//  RazeNetworkingTests.swift
//  RazeCoreTests
//
//  Created by Niclas Nordling on 2020-06-11.
//

import XCTest
@testable import RazeCore

final class RazeNetworkingTests: XCTestCase {
    func testLoadDataCall() {
        let manager = RazeCore.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for data")
        guard let url = URL(string: "https://raywenderlich.com") else { return XCTFail() }
        
        manager.loadData(from: url) { result in
            expectation.fulfill()
            
            switch result {
            case .success(let returnedData):
                XCTAssertNotNil(returnedData, "response data is nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error forming error")
            }
        }
    }
    
    static var allTests = [
        ("testLoadDataCall", testLoadDataCall)
    ]

}
