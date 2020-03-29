//
//  GuidelinesTableViewCell.swift
//  iStaySafe
//
//  Created by Z Xiao on 3/29/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import UIKit

class GuidelinesTableViewCell: UITableViewCell {
    @IBOutlet weak var graphicImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let imagePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 150, height: 125))
        descriptionTextView.textContainer.exclusionPaths = [imagePath]
        descriptionTextView.sizeToFit()
        descriptionTextView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setGuideline(guideline: Guideline) {
        graphicImageView.image = guideline.image
        titleLabel.text = guideline.title
        descriptionTextView.text = guideline.description
    }

}
