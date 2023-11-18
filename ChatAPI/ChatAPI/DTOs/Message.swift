//
//  Message.swift
//  ChatAPI
//
//  Created by eren  on 18/11/2023.
//

import Foundation
import Utilities

public struct Message: Codable {
    public let id: String
    public let text: String
    public let lastUpdated: String

    public var date: Date {
        return Date(chatServiceStyle: lastUpdated)
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case text = "text"
        case lastUpdated = "last_updated"
    }

    public init(id: String = "", text: String, date: Date) {
        self.id = id
        self.text = text
        self.lastUpdated = date.showAsServiceStyleFormat()
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        text = try values.decode(String.self, forKey: .text)
        lastUpdated = try values.decode(String.self, forKey: .lastUpdated)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(text, forKey: .text)
        try container.encode(lastUpdated, forKey: .lastUpdated)
    }
}
