//
//  ChatDetailViewModel.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import Foundation
import ChatAPI

final class ChatDetailViewModel: ChatDetailViewModelProtocol {

    weak var delegate: ChatDetailViewModelDelegate?

    private var chat: Chat!
    private var messages: [Message] = []

    init(chat: Chat) {
        self.chat = chat
    }

    func load() {
        notify(.updateTitle(chat.id))
        arrangeMessages()
    }

    private func arrangeMessages() {
        self.messages = chat.messages.sorted(by: {
            $0.date < $1.date
       })
        arrangePresentations()
    }

    private func arrangePresentations() {
        let presentations = self.messages.map({
            ChatDetailPresentation(message: $0.text, date: $0.date.showAsStandartFormat())
        })
        notify(.showChatDetails(presentations))
    }

    func sendMessage(text: String) {
        messages.append(Message(text: text, date: Date()))
        arrangePresentations()
    }

    private func notify(_ output: ChatDetailViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
