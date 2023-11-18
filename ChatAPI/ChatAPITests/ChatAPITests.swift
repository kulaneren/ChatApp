//
//  ChatAPITests.swift
//  ChatAPITests
//
//  Created by eren  on 17/11/2023.
//

import XCTest
@testable import ChatAPI

final class ChatAPITests: XCTestCase {

    var sut: ChatService!

    override func setUpWithError() throws {
        sut = ChatService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetChats() throws {
        sut.getChats { result in
            switch result {
            case .success(let chats):
                XCTAssertGreaterThan(chats.count, 0)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }
}
