//
//  VerificationPandingCollectionView.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 05/11/23.
//

import UIKit

class VerificationPandingCollectionView: UICollectionViewCell {

    @IBOutlet weak var lblCOngragulation: UILabel!
    @IBOutlet weak var lblAndIts: UILabel!
    @IBOutlet weak var imgBig: UIImageView!
    @IBOutlet weak var btnGotoDashboard: UIButton!
    
    var gotoDashBoardbtnClicked:(()->Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnGotoDashboard.layer.cornerRadius = 10
        btnGotoDashboard.isHidden = true
    }

    func setDataPandingCell(section:Int){
        if section == 1{
            btnGotoDashboard.isHidden = false
            imgBig.image = UIImage(named: "VerificationPanding2")
            lblAndIts.text = "Good News!!!"
            lblCOngragulation.text = "Your account has been verified and activated.Now you can manage all your properties, guest and a whole lot of other things in just one place."
            
        }
      
    }
    
    
    @IBAction func gotoDashboardBtnPressed(_ sender: UIButton) {
        gotoDashBoardbtnClicked?()
    }
}
