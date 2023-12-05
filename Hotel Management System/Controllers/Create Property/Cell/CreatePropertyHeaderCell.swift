//
//  CreatePropertyHeaderCell.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 17/11/23.
//

import UIKit

class CreatePropertyHeaderCell: UICollectionViewCell {

    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblBathroom: UILabel!
    @IBOutlet weak var viewBG: UIView!
    
    var editBtnClicked:(()->Void)?
    var deleteBtnClicked:(()->Void)?
    weak var delegate: CellDelegate?
    var section: Int = 1

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func btnDeletePressed(_ sender: UIButton) {
        delegate?.addButtonTapped(in: section)
    }
    
    @IBAction func btnEditPressed(_ sender: UIButton) {
        editBtnClicked?()
    }
    
    
}
