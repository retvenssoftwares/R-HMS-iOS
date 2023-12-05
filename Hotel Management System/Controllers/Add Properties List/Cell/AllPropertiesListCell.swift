//
//  AllPropertiesListCell.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 03/11/23.
//

import UIKit

class AllPropertiesListCell: UITableViewCell {
    
    
    // MARK: - Outlet

    @IBOutlet weak var viewBg: UIView!
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBg.backgroundColor = .white
        viewBg.layer.cornerRadius = 10.0
        viewBg.layer.shadowColor = UIColor.gray.cgColor
        viewBg.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        viewBg.layer.shadowRadius = 6.0
        viewBg.layer.shadowOpacity = 0.7
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
