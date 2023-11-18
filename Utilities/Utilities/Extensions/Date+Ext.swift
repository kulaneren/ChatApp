//
//  Date+Ext.swift
//  Utilities
//
//  Created by eren  on 18/11/2023.
//

import Foundation

extension Date {

    //2020-02-16T04:35:16
    public init(chatServiceStyle: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = formatter.date(from: chatServiceStyle) ?? Date()
        self.init(timeInterval: 0, since: date)
    }

    public func showAsServiceStyleFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter.string(from: self)
    }

    public func showAsStandartFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: self)
    }
}
