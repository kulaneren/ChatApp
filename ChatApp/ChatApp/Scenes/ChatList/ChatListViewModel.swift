//
//  ChatListViewModel.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import Foundation
import ChatAPI

final class ChatListViewModel: ChatListViewModelProtocol {

    weak var delegate: ChatListViewModelDelegate?

    private let apiService: ChatServiceProtocol
    private var chats: [Chat] = []

    init(apiService: ChatServiceProtocol) {
        self.apiService = apiService
    }

    func load() {
        notify(.updateTitle("Inbox"))
        getData()
    }

    private func getData() {

        self.notify(.setLoading(true))

        apiService.getChats() { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.notify(.setLoading(false))
            }
            switch result {
            case .success(let response):
                self.chats = response.sorted(by: {
                     $0.date > $1.date
                })
                let presenatations = self.chats.map({
                    ChatListPresentation(title: $0.name)
                })
                DispatchQueue.main.async {
                    self.notify(.showChatList(presenatations))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.notify(.showMessage(error.localizedDescription))
                }
            }
        }
    }

    func selectChat(at index: Int) {
        let chat = chats[index]
        let viewModel = ChatDetailViewModel(chat: chat)
        delegate?.navigate(to: .chatDetail(viewModel))
    }

    private func notify(_ output: ChatListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
