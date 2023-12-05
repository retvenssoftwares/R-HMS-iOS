//
//  DashboardTableCell.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 19/11/23.
//

import UIKit

class DashboardTableCell: UITableViewCell {

    // MARK: - Outlet
    @IBOutlet weak var lbl2124263: CustomLabel!
    @IBOutlet weak var lbl168: CustomLabel!
    @IBOutlet weak var lbl20546: CustomLabel!
    @IBOutlet weak var lblDeluxeRoom: CustomLabel!
    @IBOutlet weak var viewBg: UIView!
    
    // MARK: - Lifecyle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Function
    func setData(no:Int){
        if no == 0{
            viewBg.backgroundColor = UIColor.init(named: "DashboardTableColor")
            viewBg.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            viewBg.layer.cornerRadius = 10
            lbl168.textColor = .white
            lblDeluxeRoom.textColor = .white
            lbl20546.textColor = .white
            lbl2124263.textColor = .white
            lbl168.text = "Nights Sold"
            lblDeluxeRoom.text = "Top Seller"
            lbl20546.text = "ADR"
            lbl2124263.text = "Revenue"
        }else{
            
            viewBg.backgroundColor = .clear
            
            lbl168.text = "167"
            lblDeluxeRoom.text = "Deluxe Room"
            lbl20546.text = "20546"
            lbl2124263.text = "2124263"
        }
    }
}
