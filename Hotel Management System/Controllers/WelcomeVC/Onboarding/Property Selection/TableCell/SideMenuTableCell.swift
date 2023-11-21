//
//  SideMenuTableCell.swift
//  Hotel Management System
//
//  Created by mayur bobade on 11/11/23.
//

import UIKit

class SideMenuTableCell: UITableViewCell {

    @IBOutlet weak var imgDashBoard: UIImageView!
    @IBOutlet weak var lblDashboard: CustomLabel!
    @IBOutlet weak var viewBg: UIView!
    
    
    var viewColor:String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setDataSideTable(no:Int){
        if no == 0{
            lblDashboard.text = "Dashboard"
        }
        else if no == 1{
            lblDashboard.text = "Rates and Inventory"
        }
        else if no == 2{
            lblDashboard.text = "Create Reservation"
        }
        else if no == 3{
            lblDashboard.text = "Channels & Mapping"
        }
        else if no == 4{
            lblDashboard.text = "Booking Engine"
        }
        else if no == 5{
            lblDashboard.text = "Reservations"
        }
        else if no == 6{
            lblDashboard.text = "Promotions"
        }
        else if no == 7{
            lblDashboard.text = "Reports & Logs"
        }
    }
    
}
