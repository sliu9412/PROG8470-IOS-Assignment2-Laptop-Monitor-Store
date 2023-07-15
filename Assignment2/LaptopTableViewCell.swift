//
//  laptopTableViewCell.swift
//  Assignment2_siyu
//
//  Created by user on 2023-03-20.
//

import UIKit

class laptopTableViewCell: UITableViewCell {
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var SubTitleLabel: UILabel!
    @IBOutlet var PriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
