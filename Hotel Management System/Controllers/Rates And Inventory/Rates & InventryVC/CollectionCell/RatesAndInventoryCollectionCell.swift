//
//  RatesAndInventoryCollectionCell.swift
//  Hotel Management System
//
//  Created by mayur bobade on 07/11/23.
//

import UIKit

class RatesAndInventoryCollectionCell: UICollectionViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData(no:Int){
        if no == 1 {
            stackView.backgroundColor = UIColor.black
            lblDay.textColor = UIColor.white
            lblDate.textColor = UIColor.white
            stackView.layer.cornerRadius = 5
            lblDay.text = "Tue"
            lblDate.text = "23"
            
        } else if no == 2 {
            lblDay.text = "Wed"
            lblDate.text = "24"
        }
        else if no == 3{
            lblDay.text = "Thu"
            lblDate.text = "25"
        } else if no == 4{
            lblDay.text = "Fri"
            lblDate.text = "26"
        }else if no == 5{
            lblDay.text = "Sat"
            lblDate.text = "27"
        }else if no == 6{
            lblDay.text = "Sun"
            lblDate.text = "28"
        }
    }
}
