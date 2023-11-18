//
//  UtilitiesTests.swift
//  UtilitiesTests
//
//  Created by eren  on 18/11/2023.
//

import XCTest
@testable import Utilities

final class Date_ExtensionsTests: XCTestCase {

    func testShowAsStandartFormat() {
        let date = Date(chatServiceStyle: "2023-10-29T07:03:42")
        let standartFormat = date.showAsStandartFormat()

        XCTAssertEqual(standartFormat, "2023-10-29 07:03:42")
    }
}
