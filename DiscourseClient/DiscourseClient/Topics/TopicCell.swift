//
//  TopicCell.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Celda que representa un topic en la lista
class TopicCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var postCountLabel: UILabel?
    @IBOutlet weak var posterCount: UILabel?
    @IBOutlet weak var lastPostDateLabel: UILabel?
    
    var viewModel: TopicCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.delegate = self
            titleLabel?.text = viewModel.titleText
            postCountLabel?.text = viewModel.postCountText
            posterCount?.text = viewModel.posterCountText
            lastPostDateLabel?.text = viewModel.dateText
            setUserPhoto()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let width = userImageView?.bounds.width {
            userImageView?.layer.cornerRadius =  width / 2
        }
        userImageView?.layer.borderWidth = 1
        userImageView?.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userImageView?.image = nil
        titleLabel?.text = nil
        postCountLabel?.text = nil
        posterCount?.text = nil
        lastPostDateLabel?.text = nil
    }
    
    private func setUserPhoto() {
        DispatchQueue.main.async {
            self.userImageView?.image = self.viewModel?.userImage
        }
    }
}

extension TopicCell: TopicCellViewModelDelegate {
    func didDownload(image: UIImage?) {
        DispatchQueue.main.async {
            self.userImageView?.image = self.viewModel?.userImage
        }
    }
}
