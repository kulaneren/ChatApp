//
//  AppContainerTests.swift
//  ChatAppTests
//
//  Created by eren  on 18/11/2023.
//

import XCTest

@testable import ChatApp

final class AppContainerTests: XCTestCase {

    func testAppContainerInit() {
        let appContainer = AppContainer()

        XCTAssertNotNil(appContainer.router)
        XCTAssertNotNil(appContainer.apiService)
    }
}

