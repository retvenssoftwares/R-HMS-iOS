//
//  NewPropertyProfileVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 17/11/23.
//

import UIKit
import iOSDropDown

class NewPropertyProfileVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Oulet
    @IBOutlet weak var newpropertyCollectionCell: UICollectionView!
    @IBOutlet weak var txtFieldDescraption: UITextField!
    @IBOutlet weak var txtFieldWebsite: UITextField!
    @IBOutlet weak var txtFieldHotel: DropDown!
    @IBOutlet weak var txtFieldEnterProperty: UITextField!
    @IBOutlet weak var imgprofile: UIImageView!
    
    
    var imagePicker = UIImagePickerController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        newpropertyCollectionCell.register(UINib(nibName: "NewRoomTypeCollectionCell", bundle: .main), forCellWithReuseIdentifier: "NewRoomTypeCollectionCell")
        let color = UIColor.init(named: "TextColor")
        txtFieldEnterProperty.attributedPlaceholder = NSAttributedString(string: txtFieldEnterProperty.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldHotel.attributedPlaceholder = NSAttributedString(string: txtFieldHotel.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])

        txtFieldWebsite.attributedPlaceholder = NSAttributedString(string: txtFieldWebsite.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])

        txtFieldDescraption.attributedPlaceholder = NSAttributedString(string: txtFieldDescraption.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])

    }

    // MARK: - Function
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        guard let image = info[.editedImage] as? UIImage else {return}
        imgprofile.image = image
        dismiss(animated: true)
    }

    

    // MARK: - Action
    @IBAction func profileChangeBtnPressed(_ sender: UIButton) {
        let picker = UIImagePickerController()
          picker.allowsEditing = true
          picker.delegate = self
          present(picker, animated: true)
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
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        
        
        let fullPhotoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1/3))
        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 5,leading: 5,bottom: 5,trailing: 5)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: fullPhotoItem,
            count: 3
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
