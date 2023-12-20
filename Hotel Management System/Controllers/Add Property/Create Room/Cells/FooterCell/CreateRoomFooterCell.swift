//
//  CreateRoomFooterCell.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 05/11/23.
//

import UIKit

class CreateRoomFooterCell: UICollectionViewCell {

    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnSave.isHidden = true
        btnCancel.isHidden = true
        btnSave.layer.cornerRadius = 5
            }

    
    func setData(section:Int){
        
        if section == 5{
            btnSave.isHidden = false
            btnCancel.isHidden = false
        }
        
        
    }
    
}
