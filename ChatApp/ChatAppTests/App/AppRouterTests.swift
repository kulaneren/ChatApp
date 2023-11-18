//
//  AppRouterTests.swift
//  ChatAppTests
//
//  Created by eren  on 18/11/2023.
//

import XCTest

@testable import ChatApp

final class AppRouterTests: XCTestCase {

    var appRouter: AppRouter!

    override func setUpWithError() throws {
        appRouter = AppRouter()
    }

    override func tearDownWithError() throws {
        appRouter = nil
    }

    func testAppRouterInit() {
        XCTAssertNotNil(appRouter.window)
    }

    func testStart() {
        appRouter.start()

        guard let rootNavigationController = appRouter.window.rootViewController as? UINavigationController else {
            XCTFail("Window's rootViewController can't be nil")
            return
        }
        guard let topViewController = rootNavigationController.topViewController else {
            XCTFail("TopViewController can't be nil")
            return
        }
        XCTAssertTrue(topViewController.isKind(of: ChatListViewController.self))
    }
}


