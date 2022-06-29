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
        }
    }
    
    func testJsonDataMapping() throws{
        guard let url = URL(string: "https://api.themoviedb.org/3/person/71580/credits?api_key=0d8ec3e33976d97a6c12cd02ecad0d15") else {
            XCTFail("No Movies Data")
            return
        }

        let json = try Data(contentsOf: url)
        let movies: MovieCast = try JSONDecoder().decode(MovieCast.self, from: json)
        let cumberbatchmovies:[CumberbatchMovies] =  movies.cast
        XCTAssertNotNil(cumberbatchmovies)
    }

}
