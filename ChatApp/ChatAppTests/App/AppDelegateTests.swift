//
//  AppDelegateTests.swift
//  ChatAppTests
//
//  Created by eren  on 18/11/2023.
//

import XCTest

@testable import ChatApp

final class AppDelegateTests: XCTestCase {

    func testApplicationDidFinishLaunchingWithOptions() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let result = appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: [:])

        XCTAssertTrue(result)
    }
}
