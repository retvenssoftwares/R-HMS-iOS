//
//  CreateRoomHeaderCell.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 04/11/23.
//

import UIKit

class CreateRoomHeaderCell: UICollectionViewCell {

    @IBOutlet weak var lblHeading: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    
    func setData(section:Int){
        if section == 0{
            lblHeading.text = "Room"
        }else if section == 2{
            lblHeading.text = "View"
        }else if section == 4{
            lblHeading.text =  "Badroom"
        }
       
        
    }
    
}
