//
//  ChatDetailBuilder.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import UIKit

final class ChatDetailBuilder {

    static func make(with viewModel: ChatDetailViewModelProtocol) -> ChatDetailViewController {
        let storyboard = UIStoryboard(name: "ChatDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: ChatDetailViewController.storyboardIdentifier) as! ChatDetailViewController
        viewController.viewModel = viewModel

        return viewController
    }
}
