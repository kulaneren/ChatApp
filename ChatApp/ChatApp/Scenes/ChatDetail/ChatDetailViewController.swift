//
//  ChatDetailViewController.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import UIKit

final class ChatDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonSend: UIButton!


    private var messages: [ChatDetailPresentation] = []

    var viewModel: ChatDetailViewModelProtocol! {
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
        tableView.register(UINib(nibName: "ChatDetailTableViewCell", bundle: nil), forCellReuseIdentifier: ChatDetailTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension

        buttonSend.tintColor = UIColor.theme.accent
        buttonSend.setTitle("Send", for: .normal)
    }

    //MARK: Intents

    @IBAction func buttonSendTapped(_ sender: Any) {
        if let text = textField.text, text != "" {
            viewModel.sendMessage(text: text)
            textField.text = ""
        }
    }
}

// MARK: - ChatDetailViewModelDelegate

extension ChatDetailViewController: ChatDetailViewModelDelegate {
    func handleViewModelOutput(_ output: ChatDetailViewModelOutput) {
        switch output {
        case .updateTitle(let text):
            self.title = text
        case .setLoading(let isLoading):
            isLoading ? showLoading() : hideLoading()
        case .showChatDetails(let messages):
            self.messages = messages
            tableView.reloadData()
            if messages.count == 0 {
                showInfo(message: "There is no messages for this user")
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ChatDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatDetailTableViewCell.identifier) as? ChatDetailTableViewCell else {
            fatalError()
        }
        let item = messages[indexPath.row]
        cell.configure(presentation: item)
        cell.selectionStyle = .none
        return cell
    }
}
