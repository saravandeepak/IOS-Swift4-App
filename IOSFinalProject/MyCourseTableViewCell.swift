//
//  MyCourseTableViewCell.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/16/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit

class MyCourseTableViewCell: UITableViewCell {

    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var instructorLabel: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.shadowOffset = CGSize(width: 5, height: 0)
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOpacity = 0.8
        bgView.layer.shadowRadius = 5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
