//
//  NewPropertyProfileVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 17/11/23.
//

import UIKit
import iOSDropDown

class NewPropertyProfileVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    // MARK: - Oulet
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var viewDescription: UIView!
    @IBOutlet weak var viewWebsite: UIView!
    @IBOutlet weak var viewStarCategory: UIView!
    @IBOutlet weak var viewPropertyType: UIView!
    @IBOutlet weak var viewPropertyName: UIView!
    @IBOutlet weak var viewStar: CosmosView!
    @IBOutlet weak var newpropertyCollectionCell: UICollectionView!
    @IBOutlet weak var txtFieldDescraption: UITextField!
    @IBOutlet weak var txtFieldWebsite: UITextField!
    @IBOutlet weak var txtFieldHotel: DropDown!
    @IBOutlet weak var txtFieldEnterProperty: UITextField!
    @IBOutlet weak var imgprofile: UIImageView!
    
    var descriptionData: String = ""
    var website: String = ""
    var hotel:String = ""
    var enterProperty:String = ""
    var hotelLogo = UIImage()

    var arrDate = ["12 Mar, 2023", "13 Mar, 2023", "14 Mar, 2023", "15 Mar, 2023", "17 Mar, 2023", "18 Mar, 2023"]
    
    var userDefaults = UserDefaults.standard
    var childData = ["Child-friendly", "Ocean View", "Day Care", "Child-friendly","Child-friendly", "Ocean View", "Day Care", "Child-friendly"]
    
    var change: [String] = []
    var imagePicker = UIImagePickerController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //childData.removeAll()
        viewStar.rating = 0
        newpropertyCollectionCell.collectionViewLayout = createCompositionalLayout()
        
        DispatchQueue.main.async {
            self.newpropertyCollectionCell.reloadData()
        }
        
        newpropertyCollectionCell.register(UINib(nibName: "NewRoomTypeCollectionCell", bundle: .main), forCellWithReuseIdentifier: "NewRoomTypeCollectionCell")
        let color = UIColor.init(named: "TextColor")
        txtFieldEnterProperty.attributedPlaceholder = NSAttributedString(string: txtFieldEnterProperty.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldHotel.attributedPlaceholder = NSAttributedString(string: txtFieldHotel.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldWebsite.attributedPlaceholder = NSAttributedString(string: txtFieldWebsite.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldDescraption.attributedPlaceholder = NSAttributedString(string: txtFieldDescraption.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        newpropertyCollectionCell.collectionViewLayout = createCompositionalLayout()
    }
    
    
    // MARK: - Function
    //    func patchAPINewPropertyProfile(propertyName:String,propertyType:String, starCatagory:String, websiteUrl:String, description:String){
    //        let url = URL(string: "https://api.hotelratna.com/api/userEdit")!
    //        let userData = MultipartFormDataRequest(url: url)
    //        userData.addTextField(named: "propertyName", value: propertyName)
    //        userData.addTextField(named: "propertyType", value: propertyType)
    //        userData.addTextField(named: "starCatagory", value: starCatagory)
    //        userData.addTextField(named: "websiteUrl", value: websiteUrl)
    //        userData.addTextField(named: "description", value: description)
    //
    //        if let dData = imgprofile.image, let imgData = dData.jpegData(compressionQuality: 0.5){
    //           userData.addDataField(named: "pic", data: imgData,mimeType: "img/jpeg")
    //        }
    //
    //        if let data = userDefaults.object(forKey: "userData"){
    ////            do{
    //                let encode = try JSONDecoder().decode(sig.self, from: Data)
    //                userData.addTextField(named: "login_token", value:encode.token )
    //                userData.addTextField(named: "username", value: encode.username)
    //                userData.addTextField(named: "phone_code", value: "+91")
    //                userData.addTextField(named: "is_push", value: encode.is_push)
    //                userData.addTextField(named: "language", value: "en")
    ////            }catch{
    ////            }
    //        }
    //
    //        URLSession.shared.dataTask(with: userData, completionHandler: { data, response, error in
    //            guard error == nil else {
    //                print(error!)
    //              return
    //            }
    //            guard let data = data else {
    //               return
    //            }
    //            do {
    //                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
    //
    //                    return
    //                }
    //                let model = try JSONDecoder().decode(ResponseModel.self, from: data)
    //                print(json)
    //                if model.error_code == "200"{
    //                    if let encoded = try? JSONEncoder().encode(model.data) {
    //                        self.userDefaults.set(encoded, forKey: "userData")
    //                    }
    //                    print("Success")
    //                }
    //            } catch let error {
    //                print(error.localizedDescription)
    //                print(error)
    //
    //            }
    //        }).resume()
    //    }
    
    
    
    func deleteItem(at indexPath: IndexPath) {
        if arrDate.count > 0 {
            arrDate.remove(at: indexPath.row)
        }
        DispatchQueue.main.async {
            self.newpropertyCollectionCell.reloadData()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        
        guard let image = info[.editedImage] as? UIImage else {return}
        imgprofile.image = image
        var hotelLogo = image
        saveImageToUserDefaults(image: hotelLogo, key: "hotelLogo")
        loadImageFromUserDefaults(key: "hotelLogo")
        dismiss(animated: true)
    }
    func onUserAction(data: [String]) {
        
        childData.removeAll()
        for data in data {
            //print(data)
            childData.append(data)
            //change.append(data)
            //print("Data received: \(data)")
        }
        newpropertyCollectionCell.reloadData()
        print(childData)
        //print(childData)
    }
    
    func createPropertyValidation() {
        if txtFieldEnterProperty.text?.isEmpty == true {
            txtFieldEnterProperty.attributedPlaceholder = NSAttributedString(
                string: "Enter Property Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            viewPropertyName.borderColor = UIColor.red
        } else {
            viewPropertyName.borderColor = UIColor.textFiledViewLine
        }
        
        //MARK: Property Type
        if txtFieldHotel.text?.isEmpty == true {
            txtFieldHotel.attributedPlaceholder = NSAttributedString(
                string: "Hotel", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            viewPropertyType.borderColor = UIColor.red
        } else {
            viewPropertyType.borderColor = UIColor.textFiledViewLine
        }
        //        MARK: star catogary
        if viewStar.rating == 0 {
            viewStarCategory.borderColor = UIColor.red
            
        } else {
            viewStarCategory.borderColor = UIColor.textFiledViewLine
        }
        //MARK: website
        if txtFieldWebsite.text?.isEmpty == true {
            txtFieldWebsite.attributedPlaceholder = NSAttributedString(
                string: "www.book@hotel.com", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            viewWebsite.borderColor = UIColor.red
            
        } else {
            viewWebsite.borderColor = UIColor.textFiledViewLine
        }
        //MARK: description
        if txtFieldDescraption.text?.isEmpty == true {
            txtFieldDescraption.attributedPlaceholder = NSAttributedString(
                string: "Enter Description", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            viewDescription.borderColor = UIColor.red
            
        } else {
            viewDescription.borderColor = UIColor.textFiledViewLine
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddressAndContactVC") as! AddressAndContactVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func profileImageIsEmpty() -> Bool {
        return imgprofile.image == nil
    }
    
    private func showValidationAlert(message: String) {
        let alert = UIAlertController(
            title: "Validation Error",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Action
    @IBAction func profileChangeBtnPressed(_ sender: UIButton) {
        if profileImageIsEmpty() {
            showValidationAlert(message: "Please select a profile image.")
        } else {
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.delegate = self
            present(picker, animated: true)
        }
        
        
    }
    @IBAction func btnAddPropertyAmenityPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddAmenityVC") as! AddAmenityVC
        vc.previousVC = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnNavigationNextPressed(_ sender: UIButton) {
//        txtFieldHotel.didSelect { (selectedItem, index, id) in
//            // Store the selected value in UserDefaults
//            self.userDefaults.set(selectedItem, forKey: "propertyType")
//        }
        userDefaults.setValue(txtFieldWebsite.text, forKey: "website")
        userDefaults.setValue(txtFieldDescraption.text, forKey: "descriptionData")
        userDefaults.setValue(txtFieldEnterProperty.text, forKey: "enterProperty")
        userDefaults.setValue(viewStar.rating, forKey: "rating")
        userDefaults.setValue(txtFieldHotel.text, forKey: "propertyType")
        
        createPropertyValidation()
    }
    
    
    
    func saveImageToUserDefaults(image: UIImage, key: String) {
        if let imageData = image.toData() {
            UserDefaults.standard.set(imageData, forKey: key)
        }
    }
    
    func loadImageFromUserDefaults(key: String) -> UIImage? {
        if let imageData = UserDefaults.standard.data(forKey: key) {
            return imageData.toImage()
        }
        return nil
    }
    @IBAction func btnNavigationBackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}



// MARK: - Extension CollectionView

extension NewPropertyProfileVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return self.generateChatModule()
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        layout.configuration = config
        return layout
    }
    func generateChatModule() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/2),
            heightDimension: .fractionalHeight(1.0))
        
        
        let fullPhotoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(60))
        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 0,leading: 0,bottom: 5,trailing: 0)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: fullPhotoItem,
            count: 2
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewRoomTypeCollectionCell", for: indexPath) as! NewRoomTypeCollectionCell
        cell.childLbl.text = arrDate[indexPath.row]
        cell.btnDeleteClicked = { [weak self] in
            self?.deleteItem(at: indexPath)
        }
        return cell
    }
}

