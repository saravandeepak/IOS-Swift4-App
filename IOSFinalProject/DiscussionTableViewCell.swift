//
//  DiscussionTableViewCell.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/17/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit

class DiscussionTableViewCell: UITableViewCell {

    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var postedBy: UILabel!
    @IBOutlet weak var postedDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
