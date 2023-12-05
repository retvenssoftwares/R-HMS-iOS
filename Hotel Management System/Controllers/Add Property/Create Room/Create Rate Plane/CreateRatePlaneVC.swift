//
//  CreateRatePlaneVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 04/11/23.
//

import UIKit
import iOSDropDown

class CreateRatePlaneVC: UIViewController {

    @IBOutlet weak var createRateCollectionView: UICollectionView!
    @IBOutlet weak var txtFieldTottalRate2: UITextField!
    @IBOutlet weak var txtFieldInclusion2: UITextField!
    @IBOutlet weak var txtfieldShortCode2: UITextField!
    @IBOutlet weak var txtFieldRateplane2: UITextField!
    @IBOutlet weak var viewEditField2: UIView!
    @IBOutlet weak var txtFieldTottalRate: UITextField!
    @IBOutlet weak var txtFieldInclusion: UITextField!
    @IBOutlet weak var txtFieldShortCOde: UITextField!
    @IBOutlet weak var txtFieldRatePlane1: UITextField!
    @IBOutlet weak var viewEditField1: UIView!
    @IBOutlet weak var viewRateType: UIView!
    @IBOutlet weak var txtFieldViewRate: DropDown!
    @IBOutlet weak var viewSelectCompany: UIView!
    @IBOutlet weak var txtFieldSelectCOmpany: DropDown!
    @IBOutlet weak var viewSelectRoomType: UIView!
    @IBOutlet weak var txtFieldRoomType: DropDown!
    override func viewDidLoad() {
        super.viewDidLoad()

        txtFieldViewRate.optionArray = ["ABC", "BCD", "EDG"]
        txtFieldSelectCOmpany.optionArray = ["ABC", "BCD", "EDG"]
        txtFieldRoomType.optionArray = ["ABC", "BCD", "EDG"]
        
        createRateCollectionView.register(UINib(nibName: "CreateRoomRateCollectionCell", bundle: .main), forCellWithReuseIdentifier: "CreateRoomRateCollectionCell")
  
    }
    
  
    
    
    
    
    
    func textFieldPlaceHolderTextColor(){
        let color = UIColor.init(named: "placeHolderColor")
        txtFieldViewRate.attributedPlaceholder = NSAttributedString(string: txtFieldViewRate.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
      
        txtFieldSelectCOmpany.attributedPlaceholder = NSAttributedString(string: txtFieldSelectCOmpany.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
      
        txtFieldRoomType.attributedPlaceholder = NSAttributedString(string: txtFieldRoomType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        
        
        txtFieldRatePlane1.attributedPlaceholder = NSAttributedString(string: txtFieldRoomType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldShortCOde.attributedPlaceholder = NSAttributedString(string: txtFieldRoomType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldInclusion.attributedPlaceholder = NSAttributedString(string: txtFieldRoomType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldTottalRate.attributedPlaceholder = NSAttributedString(string: txtFieldRoomType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldRateplane2.attributedPlaceholder = NSAttributedString(string: txtFieldRoomType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtfieldShortCode2.attributedPlaceholder = NSAttributedString(string: txtFieldRoomType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        

        txtFieldInclusion2.attributedPlaceholder = NSAttributedString(string: txtFieldRoomType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        

        txtFieldTottalRate2.attributedPlaceholder = NSAttributedString(string: txtFieldRoomType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        

        
        
      
    }
    @IBAction func editTextField1BtnPressed(_ sender: UIButton) {
        txtFieldRatePlane1.isUserInteractionEnabled = true
        txtFieldShortCOde.isUserInteractionEnabled = true
        txtFieldInclusion.isUserInteractionEnabled = true
        txtFieldTottalRate.isUserInteractionEnabled = true
    }
    
    @IBAction func editTextField2BtnPressed(_ sender: UIButton) {
        txtFieldRateplane2.isUserInteractionEnabled = true
        txtfieldShortCode2.isUserInteractionEnabled = true
        txtFieldInclusion2.isUserInteractionEnabled = true
        txtFieldTottalRate2.isUserInteractionEnabled = true
    }
   

}


extension CreateRatePlaneVC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateRoomRateCollectionCell", for: indexPath) as! CreateRoomRateCollectionCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: 100)
    }
    
}
