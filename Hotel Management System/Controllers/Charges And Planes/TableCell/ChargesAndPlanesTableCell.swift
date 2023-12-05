//
//  ChargesAndPlanesTableCell.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 22/11/23.
//

import UIKit

class ChargesAndPlanesTableCell: UITableViewCell {

    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var txtField3600: UITextField!
    @IBOutlet weak var txtFIeldRatePlaneTottal: UITextField!
    @IBOutlet weak var txtField6Inclusion: UITextField!
    @IBOutlet weak var txtFieldDeluxeCP: UITextField!
    
    var deleteBtnClicked:(()->Void)?
    var editBtnClicked:(()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       textFieldPlaceholderColor()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func textFieldPlaceholderColor(){
        let color = UIColor.init(named: "RatePlanesTableCellTextColor")
        
        
        txtFieldDeluxeCP.attributedPlaceholder = NSAttributedString(string: txtFieldDeluxeCP.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtField6Inclusion.attributedPlaceholder = NSAttributedString(string: txtField6Inclusion.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFIeldRatePlaneTottal.attributedPlaceholder = NSAttributedString(string: txtFIeldRatePlaneTottal.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtField3600.attributedPlaceholder = NSAttributedString(string: txtField3600.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    
    
//    func editBtnTapped(){
//        txtField3600.isUserInteractionEnabled = true
//        txtField6Inclusion.isUserInteractionEnabled = true
//        txtFIeldRatePlaneTottal.isUserInteractionEnabled = true
//        txtFieldDeluxeCP.isUserInteractionEnabled = true
//    }
    @IBAction func btnDeletePressed(_ sender: UIButton) {
        deleteBtnClicked?()
    }
    @IBAction func btnEditPressed(_ sender: UIButton) {
        editBtnClicked?()
//        editBtnTapped()
//        
    }
    
    
}
