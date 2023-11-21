//
//  RateHeaderCell.swift
//  Hotel Management System
//
//  Created by mayur bobade on 07/11/23.
//

import UIKit

class RateHeaderCell: UITableViewCell {

    @IBOutlet weak var lblVipRoom: UILabel!
    @IBOutlet weak var imgDropDown: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgDropDown.isHidden = true
        lblVipRoom.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
