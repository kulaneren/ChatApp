//
//  ChatListBuilder.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import UIKit
import ChatAPI

final class ChatListBuilder {

    static func make(apiService: ChatServiceProtocol? = nil) -> ChatListViewController {
        let storyboard = UIStoryboard(name: "ChatList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: ChatListViewController.storyboardIdentifier) as! ChatListViewController
        viewController.viewModel = ChatListViewModel(apiService: apiService ?? appContainer.apiService)

        return viewController
    }
}
