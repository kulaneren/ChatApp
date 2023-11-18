//
//  ChatDetailContratcs.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import Foundation

protocol ChatDetailViewModelProtocol {
    var delegate: ChatDetailViewModelDelegate? { get set }
    func load()
    func sendMessage(text: String)
}

enum ChatDetailViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showChatDetails([ChatDetailPresentation])
}

protocol ChatDetailViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: ChatDetailViewModelOutput)
}
