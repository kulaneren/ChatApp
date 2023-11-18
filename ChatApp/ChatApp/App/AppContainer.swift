//
//  AppContainer.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import Foundation
import ChatAPI

let appContainer = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let apiService = ChatService()
}
