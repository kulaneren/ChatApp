//
//  AppRouter.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import UIKit

final class AppRouter {

    let window: UIWindow

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)

    }

    func start() {
        showChatList()
    }

    private func showChatList() {
        let viewController = ChatListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
