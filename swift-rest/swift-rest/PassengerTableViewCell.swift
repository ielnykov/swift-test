//
//  PassengerTableViewCell.swift
//  swift-rest
//
//  Created by Victor Yelnikoff on 30.01.17.
//  Copyright © 2017 Victor Yelnikoff. All rights reserved.
//

import UIKit

class PassengerTableViewCell: UITableViewCell {
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
