//
//  CreatePropertyHeaderTwoCollectionViewCell.swift
//  Hotel Management System
//
//  Created by mayur bobade on 04/12/23.
//

import UIKit
protocol CellDelegate: AnyObject {
    func addButtonTapped(in section: Int)
}
struct SectionData {
    var images: [UIImage] = []
}

class CreatePropertyHeaderTwoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblBathroom: UILabel!
    @IBOutlet weak var viewBG: UIView!
    
    var editBtnClicked:(()->Void)?
    var addBtnClicked:(()->Void)?
    var deleteBtnClicked:(()->Void)?
    weak var delegate: CellDelegate?
    var section: Int = 1

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func btnDeletePressed(_ sender: UIButton) {
        deleteBtnClicked?()
    }
    
    @IBAction func addBtn(_ sender: Any) {
        delegate?.addButtonTapped(in: section)
        
    }
    @IBAction func btnEditPressed(_ sender: UIButton) {
        editBtnClicked?()
    }
}
