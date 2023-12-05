//
//  DiscountHeaderCell.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 25/11/23.
//

import UIKit

class DiscountHeaderCell: UITableViewCell {

    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var lblNumberOfSelection: UILabel!
    @IBOutlet weak var lblDeluxeRoom: UILabel!
    @IBOutlet weak var btnSelectedCheak: UIButton!
    @IBOutlet weak var viewBg: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    func setExpanded() {
        btnDropDown.setImage(UIImage(named: "TableDropDown"), for: .normal)
    }

    func setCollapsed() {
        btnDropDown.setImage(UIImage(named: "ExtendDropDown"), for: .normal)
    }

    @IBAction func btnSelectedCheak(_ sender: UIButton) {
       
    }
  
    
    @IBAction func btnDropDown(_ sender: UIButton) {
    }
}
