//
//  ChannelsTableCell.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 08/11/23.
//

import UIKit

class ChannelsTableCell: UITableViewCell {

    
    // MARK: - Outlet
    @IBOutlet weak var lblHotelName: UILabel!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var viewBg: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
