//
//  NewRoomTypeCollectionCell.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 14/11/23.
//

import UIKit

class NewRoomTypeCollectionCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var childLbl: UILabel!
    
    
    var btnDeleteClicked:(()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnDeletePressed(_ sender: UIButton) {
        btnDeleteClicked?()
    }
}
