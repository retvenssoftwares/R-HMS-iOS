//
//  MapingTableCell.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 09/11/23.
//

import UIKit

class MapingTableCell: UITableViewCell {

    @IBOutlet weak var imgDropDown: UIImageView!
    @IBOutlet weak var lblDeluxeRoomBlue: UILabel!
    @IBOutlet weak var imgLink: UIImageView!
    @IBOutlet weak var lblDeluxeRoom: UILabel!
    @IBOutlet weak var viewBg: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    }
    
    
    func setData(no:Int){
      
         if no == 1{
            lblDeluxeRoom.text = "Deluxe AP"
            viewBg.backgroundColor = .clear
        }
        else if no == 2{
            lblDeluxeRoom.text = "Deluxe EP"
            viewBg.backgroundColor = .clear
        }
        else if no == 3{
            lblDeluxeRoom.text = "Deluxe Cp"
            viewBg.backgroundColor = .clear
        }
        else if no == 4{
            lblDeluxeRoom.text = "Deluxe MAP"
            viewBg.backgroundColor = .clear
        }
        else {
           
        }
    }
    
}
