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
        
        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

//        let attachment = XCTAttachment(screenshot: app.screenshot())
//        attachment.name = "Launch Screen"
//        attachment.lifetime = .keepAlways
//        add(attachment)
    }
}
