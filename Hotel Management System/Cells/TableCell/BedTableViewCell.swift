//
//  BedTableViewCell.swift
//  Hotel Management System
//
//  Created by mayur bobade on 04/11/23.
//

import UIKit

class BedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var calendarBtn: UIButton!
    @IBOutlet weak var grandHotel: UIButton!
    @IBOutlet weak var usetBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func calendarBtn(_ sender: Any) {
    }
    @IBAction func notificationBtn(_ sender: Any) {
    }
}
