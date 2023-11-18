//
//  ChatListContracts.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import Foundation

protocol ChatListViewModelProtocol {
    var delegate: ChatListViewModelDelegate? { get set }
    func load()
    func selectChat(at index: Int)
}

enum ChatListViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showChatList([ChatListPresentation])
    case showMessage(String)
}

enum ChatListViewRoute {
//    case ChatDetail(ChatDetailViewModelProtocol)
}

protocol ChatListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: ChatListViewModelOutput)
    func navigate(to route: ChatListViewRoute)
}
