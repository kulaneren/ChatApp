//
//  Chat.swift
//  ChatAPI
//
//  Created by eren  on 18/11/2023.
//

import Foundation
import Utilities

public struct Chat: Codable {
    public let id: String
    public let name: String
    public let lastUpdated: String
    public let messages: [Message]

    public var date: Date {
        return Date(chatServiceStyle: lastUpdated)
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case lastUpdated = "last_updated"
        case messages = "messages"
    }

    public init(id: String,
                name: String,
                lastUpdated: String,
                messages: [Message]) {
        self.id = id
        self.name = name
        self.lastUpdated = lastUpdated
        self.messages = messages
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        lastUpdated = try values.decode(String.self, forKey: .lastUpdated)
        messages = try values.decode([Message].self, forKey: .messages)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(lastUpdated, forKey: .lastUpdated)
        try container.encode(messages, forKey: .messages)
    }
}
