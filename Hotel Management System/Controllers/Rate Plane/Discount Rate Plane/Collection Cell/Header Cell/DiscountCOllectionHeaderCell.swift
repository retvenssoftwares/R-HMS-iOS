//
//  DiscountCOllectionHeaderCell.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 25/11/23.
//

import UIKit

class DiscountCOllectionHeaderCell: UICollectionViewCell {

    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var lblHeader: UILabel!
    
    var addDataClicked:(()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnAddPressed(_ sender: UIButton) {
        addDataClicked?()
    }
}
