//
//  OnboardingViewController.swift
//  Retvent
//
//  Created by mayur bobade on 01/11/23.
//

import UIKit

class OnboardingViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Oulet

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var viewChainName: UIView!
    @IBOutlet weak var viewGroupImg: UIView!
    @IBOutlet weak var viewNumberOfProperty: UIView!
    @IBOutlet weak var viewPropertyType: UIView!
    @IBOutlet weak var viewWebsiteURL: UIView!
    @IBOutlet weak var viewINR: UIView!
    @IBOutlet weak var txtfFieldPropertyType: UITextField!
    @IBOutlet weak var txtFieldPropertyChainName: UITextField!
    @IBOutlet weak var txtFieldWebsiteUrl: UITextField!
    @IBOutlet weak var txtFieldINR: UITextField!
    
    
    var someValue:Int = 0{
        didSet{
            lblNumber.text = "\(someValue)"
        }
    }
    
    var imagePicker = UIImagePickerController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewGroupImg.backgroundColor = .white
        viewGroupImg.layer.cornerRadius = 10.0
        viewGroupImg.layer.shadowColor = UIColor.gray.cgColor
        viewGroupImg.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        viewGroupImg.layer.shadowRadius = 6.0
        viewGroupImg.layer.shadowOpacity = 0.7
        viewChainName.layer.borderWidth = 1
        viewChainName.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewChainName.layer.cornerRadius = 10
        viewNumberOfProperty.layer.borderWidth = 1
        viewNumberOfProperty.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewNumberOfProperty.layer.cornerRadius = 10
        viewPropertyType.layer.borderWidth = 1
        viewPropertyType.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewPropertyType.layer.cornerRadius = 10
        viewWebsiteURL.layer.borderWidth = 1
        viewWebsiteURL.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewWebsiteURL.layer.cornerRadius = 10
        viewINR.layer.borderWidth = 1
        viewINR.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewINR.layer.cornerRadius = 10
        btnSubmit.layer.cornerRadius = 10
        let color = UIColor.init(named: "TextColor")
        txtfFieldPropertyType.attributedPlaceholder = NSAttributedString(string: txtfFieldPropertyType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldPropertyChainName.attributedPlaceholder = NSAttributedString(string: txtFieldPropertyChainName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldWebsiteUrl.attributedPlaceholder = NSAttributedString(string: txtFieldWebsiteUrl.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldINR.attributedPlaceholder = NSAttributedString(string: txtFieldINR.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        someValue = 0
        
          }
    
    
    // MARK: - Action
    @IBAction func profileChangeBtnPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                    print("Button capture")

                    imagePicker.delegate = self
                    imagePicker.sourceType = .savedPhotosAlbum
                    imagePicker.allowsEditing = false

                    present(imagePicker, animated: true, completion: nil)
                }
        
        func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
                self.dismiss(animated: true, completion: { () -> Void in

                })

                imgProfile.image = image
            }
        
    }
    @IBAction func addBtnPressed(_ sender: UIButton) {
      someValue += 1
    }
    @IBAction func removeBtnPressed(_ sender: UIButton) {
        someValue += -1
    }
    @IBAction func btnSubmitPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingSingleProperty2VC") as! OnboardingSingleProperty2VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
  
}
