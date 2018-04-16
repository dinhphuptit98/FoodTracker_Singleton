//
//  MealTableViewCell.swift
//  FoodTracker2
//
//  Created by dinhphu98 on 4/9/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ratingControll: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
