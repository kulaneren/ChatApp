//
//  ChatListViewController.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import UIKit

final class ChatListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var chats: [ChatListPresentation] = []

    var viewModel: ChatListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        viewModel.load()
    }

    //MARK: Helpers

    private func updateUI() {
        self.hideKeyboardWhenTappedAround()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ChatListTableViewCell", bundle: nil), forCellReuseIdentifier: ChatListTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: - ChatListViewModelDelegate

extension ChatListViewController: ChatListViewModelDelegate {
    func handleViewModelOutput(_ output: ChatListViewModelOutput) {
        switch output {
        case .updateTitle(let text):
            self.title = text
        case .showMessage(let text):
            self.showInfo(message: text)
        case .setLoading(let isLoading):
            isLoading ? showLoading() : hideLoading()
        case .showChatList(let chatItems):
            self.chats = chatItems
            tableView.reloadData()
            if chats.count == 0 {
                showInfo(message: "There is no chat item for this user")
            }
        }
    }

    func navigate(to route: ChatListViewRoute) {
        switch route {
            // TODO
//        case .ChatDetail(let viewModel):
//            let viewController = ChatDetailBuilder.make(with: viewModel)
//            show(viewController, sender: nil)
        }
    }
}

// MARK: - UITableViewDataSource
extension ChatListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatListTableViewCell.identifier) as? ChatListTableViewCell else {
            fatalError()
        }
        let item = chats[indexPath.row]
        cell.configure(presentation: item)
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ChatListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectChat(at: indexPath.row)
    }
}

