//
//  PropertProfileVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 04/11/23.
//

import UIKit
import iOSDropDown

class PropertProfileVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    // MARK: - Outlet
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var viewPropertyName: UIView!
    @IBOutlet weak var txtFieldPropertName: UITextField!
    @IBOutlet weak var viewPropertyType: UIView!
    @IBOutlet weak var txtFieldPropertyType: DropDown!
    @IBOutlet weak var viewPropertyRating: UIView!
    @IBOutlet weak var txtFieldPropertyRating: DropDown!
    @IBOutlet weak var viewBooking: UIView!
    @IBOutlet weak var txtFieldBooking: UITextField!
    @IBOutlet weak var propertyTableView: UITableView!
    @IBOutlet weak var propertyCollectionView: UICollectionView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFieldPropertyType.optionArray = ["Hotel", "Home", "Resturant"]
        txtFieldPropertyRating.optionArray = ["25%", "35%", "100%"]
        propertyTableView.register(UINib(nibName: "AddAmenityCell", bundle: nil), forCellReuseIdentifier: "AddAmenityCell")
        
        propertyCollectionView.register(UINib(nibName: "PropertyProfileCollectionCell", bundle: .main), forCellWithReuseIdentifier: "PropertyProfileCollectionCell")
        
        btnContinue.layer.cornerRadius = 5
        textFieldViewLine()
        textFieldPlaceholederTextColorChange()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Function
    
   
    func textFieldViewLine(){
        viewPropertyName.layer.borderWidth = 1
        viewPropertyName.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewPropertyName.layer.cornerRadius = 10
        
        viewPropertyType.layer.borderWidth = 1
        viewPropertyType.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewPropertyType.layer.cornerRadius = 10
        
        viewPropertyRating.layer.borderWidth = 1
        viewPropertyRating.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewPropertyRating.layer.cornerRadius = 10
        
        viewBooking.layer.borderWidth = 1
        viewBooking.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewBooking.layer.cornerRadius = 10
        
    }
    
    func textFieldPlaceholederTextColorChange(){
        let color = UIColor.init(named: "TextColor")
        txtFieldPropertName.attributedPlaceholder = NSAttributedString(string: txtFieldPropertName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldPropertyType.attributedPlaceholder = NSAttributedString(string: txtFieldPropertyType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldPropertyRating.attributedPlaceholder = NSAttributedString(string: txtFieldPropertyRating.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldBooking.attributedPlaceholder = NSAttributedString(string: txtFieldBooking.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])

    }
    // MARK: - Function
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        guard let image = info[.editedImage] as? UIImage else {return}
        imgProfile.image = image
        dismiss(animated: true)
    }

    
    // MARK: - Action
    @IBAction func continueBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func addPropertyBtnAddress(_ sender: UIButton) {
    }
    
 
    @IBAction func changeProfileBtnPressed(_ sender: Any) {
        
        let picker = UIImagePickerController()
          picker.allowsEditing = true
          picker.delegate = self
          present(picker, animated: true)
    }
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
    }
    
}
// MARK: - Extension TableView

extension PropertProfileVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddAmenityCell", for: indexPath) as! AddAmenityCell
        return cell

    }
    
    
}


extension PropertProfileVC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyProfileCollectionCell", for: indexPath) as! PropertyProfileCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
}
