//
//  OnboardingSingleProperty2VC.swift
//  Retvent
//
//  Created by Mayur Bobade on 02/11/23.
//

import UIKit

class OnboardingSingleProperty2VC: UIViewController {

    
    // MARK: - Oulet
    @IBOutlet weak var lblNumberRate: UILabel!
    @IBOutlet weak var lblNumberRooms: UILabel!
    @IBOutlet weak var txtFieldPropertyType: UITextField!
    @IBOutlet weak var txtFieldTax: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var viewPropertyType: UIView!
    
    @IBOutlet weak var viewStar: UIView!
    @IBOutlet weak var viewRoomsOfProperties: UIView!
   
    @IBOutlet weak var viewTax: UIView!
    @IBOutlet weak var viewRate: UIView!
    
    
    // MARK: - varriable
    var someValue:Int = 0{
        didSet{
            lblNumberRooms.text = "\(someValue)"
        }
    }
    
    var rateSomeValue:Int = 0{
        didSet{
            lblNumberRate.text = "\(rateSomeValue)"
        }
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        btnSubmit.layer.cornerRadius = 10
        viewPropertyType.layer.cornerRadius = 10
        viewPropertyType.layer.borderWidth = 1
        viewPropertyType.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
        viewStar.layer.cornerRadius = 10
        viewStar.layer.borderWidth = 1
        viewStar.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
        viewRoomsOfProperties.layer.cornerRadius = 10
        viewRoomsOfProperties.layer.borderWidth = 1
        viewRoomsOfProperties.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
        viewTax.layer.cornerRadius = 10
        viewTax.layer.borderWidth = 1
        viewTax.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
        viewRate.layer.cornerRadius = 10
        viewRate.layer.borderWidth = 1
        viewRate.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
        
        let color = UIColor.init(named: "TextColor")
        txtFieldPropertyType.attributedPlaceholder = NSAttributedString(string: txtFieldPropertyType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldTax.attributedPlaceholder = NSAttributedString(string: txtFieldTax.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])

        someValue = 0
        rateSomeValue = 0
    }
    

   
    // MARK: - Action

    @IBAction func addBtnPressed(_ sender: Any) {
        someValue += 1
    }
    @IBAction func removeBtnPressed(_ sender: UIButton) {
        someValue -= 1
    }
    
    @IBAction func rateAddBtnPressed(_ sender: UIButton) {
        rateSomeValue += 1
    }
    @IBAction func rateRemoveBtnPressed(_ sender: UIButton) {
        rateSomeValue -= 1
    }
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VerificationPandingVC") as! VerificationPandingVC
        self.navigationController?.pushViewController(vc, animated: true)

    }
}
