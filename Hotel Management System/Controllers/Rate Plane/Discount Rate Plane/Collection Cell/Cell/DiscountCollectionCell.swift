//
//  DiscountCollectionCell.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 25/11/23.
//

import UIKit

class DiscountCollectionCell: UICollectionViewCell {

    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblDate: CustomLabel!
    
    var deleteBtnClicked:(()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnDeletePressed(_ sender: UIButton) {
        deleteBtnClicked?()
    }
}
