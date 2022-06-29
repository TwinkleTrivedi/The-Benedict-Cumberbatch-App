//
//  The_Benedict_Cumberbatch_AppUITestsLaunchTests.swift
//  The Benedict Cumberbatch AppUITests
//
//  Created by Twinkle T on 2022-06-27.
//

import XCTest

class The_Benedict_Cumberbatch_AppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        let myTableView = app.tables.element(matching: .table, identifier: "movieCell")
        myTableView.swipeUp()
    }
}
