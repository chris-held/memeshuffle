//
//  DankMemeServiceTests.swift
//  memeshuffle
//
//  Created by Chris Held on 7/16/17.
//  Copyright © 2017 Chris Held. All rights reserved.
//

import XCTest

@testable import memeshuffle

class DabkMemeServiceTests: XCTestCase {
    var svc: DankMemeService? = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        svc = DankMemeService();
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
    
    func testGetUrl() {
        let criteria = "funny"
        let expected = "https://www.googleapis.com/customsearch/v1?key=AIzaSyBsZ4trxyJZRx7W5tDFa6-SrCI-tAGsX0Q&cx=011910645984746659053:torlpc4hvqe&q=funny%20meme&searchType=image"
        let actual = svc?.getUrl(criteria: criteria)
        XCTAssertEqual(expected, actual)
    }
    
    func testGetRandomUrl() {
        var items = [[String: AnyObject?]]()
        items.append(["link": "foo" as AnyObject])
        let url = svc?.getRandomUrl(images: items)
        XCTAssertEqual(url, "foo")
    }
    
    //this test actually hits the server, which we don't want to
    //do since we have limited requests each day
    /*func testGetImageUrl() {
        let url = svc?.getMemeImageUrl(criteria: "test")
        XCTAssertEqual(url, "bar")
    }*/
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
