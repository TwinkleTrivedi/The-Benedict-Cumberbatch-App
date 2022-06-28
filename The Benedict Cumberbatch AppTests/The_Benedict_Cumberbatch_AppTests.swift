//
//  The_Benedict_Cumberbatch_AppTests.swift
//  The Benedict Cumberbatch AppTests
//
//  Created by Twinkle T on 2022-06-27.
//

import XCTest
@testable import The_Benedict_Cumberbatch_App

class The_Benedict_Cumberbatch_AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let mdvc=MovieDetailsViewController()
           mdvc.addCollectionview()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
//            let mdvc=MovieDetailsViewController()
//            mdvc.addCollectionview()
            let cm=CumberbatchViewController()
            cm.viewDidLoad()
            // Put the code you want to measure the time of here.
        }
    }

}
