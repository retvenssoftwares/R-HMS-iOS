//
//  DiscountTableViewCell.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 25/11/23.
//

import UIKit

class DiscountTableViewCell: UITableViewCell {

    @IBOutlet weak var btnCheak: UIButton!
    @IBOutlet weak var lblDeluxe: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblNewRoomPlane: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnCheak.isSelected = true
        
            }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func btnStateChange(){
        if btnCheak.isSelected == false {
            btnCheak.setImage(UIImage(named: "Cheak"), for: .normal)
            lblAmount.isHidden = false
            lblNewRoomPlane.isHidden = false
            btnCheak.isSelected = true
        }else {
            btnCheak.setImage(UIImage(named: "Check"), for: .normal)
            btnCheak.isSelected = false
            lblAmount.isHidden = true
            lblNewRoomPlane.isHidden = true
        }
        
    }
    
    @IBAction func btnCheakClicked(_ sender: UIButton) {
        btnStateChange()
        
    }
}
