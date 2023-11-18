//
//  ChatTableViewCell.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    static let identifier = "ChatListTableViewCell"

    @IBOutlet private weak var viewBackGround: UIView!
    @IBOutlet private weak var labelTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }

    override func prepareForReuse() {
        labelTitle.text = nil
    }

    private func updateUI() {
        viewBackGround.layer.cornerRadius = 8
        viewBackGround.layer.borderColor = UIColor.theme.accent?.cgColor
        viewBackGround.layer.borderWidth = 1
        labelTitle.textColor = UIColor.theme.text
        labelTitle.font = UIFont.systemFont(ofSize: 18, weight: .semibold)

    }

    func configure(presentation: ChatListPresentation) {
        labelTitle.text = presentation.title
    }

}

