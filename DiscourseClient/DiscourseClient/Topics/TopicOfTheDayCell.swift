//
//  TopicOfTheDayCell.swift
//  DiscourseClient
//
//  Created by José Sancho on 21/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class TopicOfTheDayCell: UITableViewCell {

    @IBOutlet weak var roundedView: UIView!
    
    var viewModel: TopicOfTheDayCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundedView?.layer.cornerRadius = 8
    }
}
