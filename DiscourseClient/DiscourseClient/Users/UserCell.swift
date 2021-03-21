//
//  UserCell.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.viewDelegate = self
            nameLabel?.text = viewModel.textLabelText
            userImageView?.image = viewModel.userImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let width = userImageView?.bounds.width {
            userImageView?.layer.cornerRadius = width / 2
        }
        userImageView?.layer.borderWidth = 1
        userImageView?.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userImageView?.image = nil
        nameLabel?.text = nil
    }
}

extension UserCell: UserCellViewModelViewDelegate {
    func userImageFetched() {
        userImageView?.image = viewModel?.userImage
        setNeedsLayout()
    }
}
