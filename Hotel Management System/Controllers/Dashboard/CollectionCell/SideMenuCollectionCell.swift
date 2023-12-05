//
//  SideMenuCollectionCell.swift
//  Hotel Management System
//
//  Created by mayur bobade on 02/12/23.
//

import UIKit

class SideMenuCollectionCell: UICollectionViewCell {

    @IBOutlet weak var lblDashBoard: CustomLabel!
    @IBOutlet weak var imgDashBoard: UIImageView!
    
    override var isSelected: Bool {
        didSet {
            // Change the background color based on the selected state
            backgroundColor = isSelected ? .black : .white
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
}
