//
//  ChatDetailTests.swift
//  ChatAppTests
//
//  Created by eren  on 18/11/2023.
//

import XCTest
@testable import ChatApp
@testable import ChatAPI

final class ChatDetailViewControllerTests: XCTestCase {

    var sut: ChatDetailViewController!

    override func setUpWithError() throws {

        let viewModel = ChatDetailViewModel(chat:
                                                Chat(id: "1",
                                                     name: "test",
                                                     lastUpdated: "2020-02-16T04:35:16",
                                                     messages: [Message(text: "Message", date: Date())]
                                                    )
        )
        sut = ChatDetailBuilder.make(with: viewModel)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInit() {
        XCTAssertNotNil(sut.viewModel)
    }

    func testViewDidLoad() {
        _ = sut.view
        XCTAssertNotNil(sut.buttonSend)
    }

    func testHandleViewModelOutput_withUpdateTitle() {
        _ = sut.view
        sut.handleViewModelOutput(.showChatDetails(
            [ChatDetailPresentation(
                message: "test",
                date: Date().showAsStandartFormat()
            )]
        ))
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ChatDetailTableViewCell
        XCTAssertEqual(cell.labelMessage.text, "test")
    }
}

