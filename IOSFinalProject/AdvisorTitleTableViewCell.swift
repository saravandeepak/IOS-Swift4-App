//
//  AdvisorTitleTableViewCell.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/15/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit

class AdvisorTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var displayImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.shadowOffset = CGSize(width: 5, height: 0)
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOpacity = 0.8
        bgView.layer.shadowRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
