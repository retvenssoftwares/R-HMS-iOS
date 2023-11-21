//
//  ReservationsTableCell.swift
//  Hotel Management System
//
//  Created by mayur bobade on 06/11/23.
//

import UIKit

class ReservationsTableCell: UITableViewCell {
    
    // MARK: - Outlet
    @IBOutlet weak var constTopBookingConfirmImg: NSLayoutConstraint!
    @IBOutlet weak var imgbackArrow: UIImageView!
    @IBOutlet weak var lblCheakOutDate: UILabel!
    @IBOutlet weak var lblcheakInDate: UILabel!
    @IBOutlet weak var lblRoomType: UILabel!
    @IBOutlet weak var lblbookingStatus: UILabel!
    @IBOutlet weak var imgGo: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    
    // MARK: - Function
    func setDataArrivalsVC(no:Int){
        if no == 0{
            lblbookingStatus.text = "Over Duo"
            
        }else {
            lblbookingStatus.text = "11:30 AM,Today"
        }
    }
    
    
    func setDataUpcoming(no:Int){
        lblbookingStatus.text = "Confirmed"
    }
    
    func setDataCancelled(no:Int){
        lblbookingStatus.text = "Cancelled"
        lblcheakInDate.isHidden = true
        lblCheakOutDate.isHidden = true
        imgbackArrow.isHidden = true
        constTopBookingConfirmImg.constant = 20
    }
}
