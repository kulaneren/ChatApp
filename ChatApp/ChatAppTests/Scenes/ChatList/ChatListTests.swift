//
//  ChatListTests.swift
//  ChatAppTests
//
//  Created by eren  on 18/11/2023.
//

import XCTest
@testable import ChatApp
@testable import ChatAPI

final class ChatListViewControllerTests: XCTestCase {

    var sut: ChatListViewController!

    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        let urlSession = URLSession.init(configuration: configuration)

        let chatService = ChatService(withURLSession: urlSession)
        loadFakeData()
        sut = ChatListBuilder.make(apiService: chatService)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    private func loadFakeData() {
        let jsonString = """
              {
                "id": "5f58bcd7a88fab5f34df94d6",
                "name": "eiusmod nostrud sunt",
                "last_updated": "2020-05-04T03:37:18",
                "messages": [
                  {
                    "id": "5f58bcd7352396fffbae8b6e",
                    "text": "Lorem labore ea et",
                    "last_updated": "2020-02-16T04:35:16"
                  },
                  {
                    "id": "5f58bcd7d95151eaa14ab8aa",
                    "text": "ex excepteur deserunt laboris",
                    "last_updated": "2020-08-18T11:16:45"
                  },
                  {
                    "id": "5f58bcd7f7745918c2252086",
                    "text": "dolore sunt reprehenderit cupidatat",
                    "last_updated": "2020-03-23T10:06:33"
                  }
                ]
              }
        """
        let data = jsonString.data(using: .utf8)

        URLProtocolMock.requestHandler = { request in
            guard let url = request.url else {
                throw ChatService.APIError.invalidUrl
            }

            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
    }

    func testInit() {
        XCTAssertNotNil(sut.viewModel)
    }

    func testViewDidLoad() {
        _ = sut.view
        XCTAssertNotNil(sut.tableView)
    }

    func testHandleViewModelOutput_withUpdateTitle() {
        _ = sut.view
        sut.handleViewModelOutput(.updateTitle("title"))
        XCTAssertEqual(sut.title, "title")
    }

    func testHandleViewModelOutput_withSetLoading() {
        _ = sut.view
        sut.handleViewModelOutput(.setLoading(true))
        XCTAssertNotNil(sut.view.viewWithTag(100))
    }

    func testHandleViewModelOutput_withSetLoadingFalse() {
        _ = sut.view
        sut.handleViewModelOutput(.setLoading(false))
        XCTAssertNil(sut.view.viewWithTag(100))
    }
}

