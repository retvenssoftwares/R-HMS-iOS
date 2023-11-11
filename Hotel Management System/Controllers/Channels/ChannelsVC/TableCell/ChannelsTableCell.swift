//
//  ChannelsTableCell.swift
//  Hotel Management System
//
//  Created by mayur bobade on 08/11/23.
//

import UIKit

class ChannelsTableCell: UITableViewCell {

    @IBOutlet weak var lblHotelName: UILabel!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var viewBg: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBg.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
