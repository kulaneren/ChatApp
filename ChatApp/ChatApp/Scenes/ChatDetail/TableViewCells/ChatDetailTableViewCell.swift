//
//  ChatDetailTableViewCell.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import UIKit

final class ChatDetailTableViewCell: UITableViewCell {
    static let identifier = "ChatDetailTableViewCell"

    @IBOutlet private weak var viewBackground: UIView!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet weak var labelMessage: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }

    override func prepareForReuse() {
        labelDate.text = nil
        labelMessage.text = nil
    }

    private func updateUI() {
        viewBackground.layer.cornerRadius = 8
        viewBackground.layer.borderColor = UIColor.theme.accent?.cgColor
        viewBackground.layer.borderWidth = 1
        labelDate.textColor = UIColor.theme.text
        labelDate.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        labelMessage.textColor = UIColor.theme.text
        labelMessage.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }

    func configure(presentation: ChatDetailPresentation) {
        labelDate.text = presentation.date
        labelMessage.text = presentation.message
    }
}
