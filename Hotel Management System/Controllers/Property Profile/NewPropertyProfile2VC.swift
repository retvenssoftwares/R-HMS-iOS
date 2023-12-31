//
//  NewPropertyProfile2VC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 17/11/23.
//

import UIKit
import iOSDropDown

class NewPropertyProfile2VC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //    @IBOutlet weak var viewPops: PopsView!
    @IBOutlet weak var newPropertyCollectionCell: UICollectionView!
    @IBOutlet weak var txtFieldDescription: UITextField!
    @IBOutlet weak var txtFieldWebsite: UITextField!
    @IBOutlet weak var txtFieldHotel: DropDown!
    @IBOutlet weak var imgProfileChange: UIImageView!
    var hotelData: String = ""
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        viewPops.isHidden = true
        if let storedOption = UserDefaults.standard.string(forKey: "hotel") {
            hotelData = storedOption
            print("hotelData: \(hotelData)")
        }
        
        if let enterProperty = UserDefaults.standard.string(forKey: "enterProperty") {
            print("enterProperty: \(enterProperty)")
        }
        
        if let descriptionData = UserDefaults.standard.string(forKey: "descriptionData") {
            
            print("descriptionData: \(descriptionData)")
        }
        if let website = UserDefaults.standard.string(forKey: "website") {
            
            print("website: \(website)")
        }
        
        
        newPropertyCollectionCell.register(UINib(nibName: "NewRoomTypeCollectionCell", bundle: .main), forCellWithReuseIdentifier: "NewRoomTypeCollectionCell")
        let color = UIColor.init(named: "TextColor")
        txtFieldHotel.attributedPlaceholder = NSAttributedString(string: txtFieldHotel.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldWebsite.attributedPlaceholder = NSAttributedString(string: txtFieldWebsite.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldDescription.attributedPlaceholder = NSAttributedString(string: txtFieldDescription.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
    }
    
    
    // MARK: - Function
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        guard let image = info[.editedImage] as? UIImage else {return}
        imgProfileChange.image = image
        dismiss(animated: true)
    }
    
    
    
    // MARK: - Action
    
    
    
    @IBAction func propertyTypePopsBtnPressed(_ sender: UIButton) {
        //        viewPops.isHidden = false
    }
    
    @IBAction func profileChangeBtnPressed(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
}




// MARK: - Extension CollectionView
extension NewPropertyProfile2VC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
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
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1.0))
        
        
        let fullPhotoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.80),
            heightDimension: .fractionalHeight(1/2))
        //fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 5,leading: 5,bottom: 5,trailing: 5)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: fullPhotoItem,
            count: 2
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewRoomTypeCollectionCell", for: indexPath) as! NewRoomTypeCollectionCell
        return cell
    }
}
