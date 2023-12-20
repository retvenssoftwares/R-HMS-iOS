//
//  ViewAllPropertyCell.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 03/11/23.
//

import UIKit

class ViewAllPropertyCell: UITableViewCell {
    
    
    // MARK: - Outlet

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var imgHotel: UIImageView!
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
       
      labelBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: - fuction
    func labelBorder(){
        view1.layer.borderWidth = 1
        view1.layer.cornerRadius = 5
        view1.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        view2.layer.borderWidth = 1
        view2.layer.cornerRadius = 5
        view2.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        view3.layer.borderWidth = 1
        view3.layer.cornerRadius = 5
        view3.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        view5.layer.borderWidth = 1
        view5.layer.cornerRadius = 5
        view5.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        view6.layer.borderWidth = 1
        view6.layer.cornerRadius = 5
        view6.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        view7.layer.borderWidth = 1
        view7.layer.cornerRadius = 5
        view7.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
    }
    
}
