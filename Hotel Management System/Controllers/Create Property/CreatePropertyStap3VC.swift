//
//  CreatePropertyStap3VC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 17/11/23.
//

import UIKit
import PhotosUI

class CreatePropertyStap3VC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var createPropertyCollectionCell: UICollectionView!
    
    var arrImage = [UIImage]()
    var arrImageBadRoom = [UIImage]()
    var bedRoomSelect: Bool = false
    var sectionsData: [SectionData] = []
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        createPropertyCollectionCell.register(UINib(nibName: "PropertyProfileCollectionCell", bundle: .main), forCellWithReuseIdentifier: "PropertyProfileCollectionCell")
         self.createPropertyCollectionCell.register(UINib(nibName: "CreatePropertyHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CreatePropertyHeaderCell")
        createPropertyCollectionCell.register(UINib(nibName: "CreatePropertyHeaderTwoCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CreatePropertyHeaderTwoCollectionViewCell")
//        createPropertyCollectionCell.collectionViewLayout = createCompositionalLayout()

    }
    
    
    
    func setupCollectionView() {
        createPropertyCollectionCell.dataSource = self
        createPropertyCollectionCell.delegate = self
        createPropertyCollectionCell.register(UINib(nibName: "CreatePropertyHeaderCell", bundle: nil), forCellWithReuseIdentifier: "CreatePropertyHeaderCell")
        createPropertyCollectionCell.register(UINib(nibName: "CreatePropertyHeaderTwoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CreatePropertyHeaderTwoCollectionViewCell")
        
        // Set up sectionsData based on the number of sections in your collection view
        sectionsData = Array(repeating: SectionData(), count: 2)
    }
    // MARK: - Function
    
    func one() {
        
    }
    
    func two() {
        
    }
    
    //MARK: CreateUserProperty
    func createProperty(authcode: String, propertyName: String, propertyType: String) {
        let parameters = [
            ["propertyName": propertyName],
            ["propertyType": propertyType]
        ]
        if let authcode = UserDefaults.standard.string(forKey: "authcode") {
            APIManager.shared.createUserProperty(parameters: parameters, authCode: authcode) { result in
                switch result {
                case .success(let response):
                    print("Status: \(response.statuscode)")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        } else {
            print("wrong authcode")
        }
        
    }
    
    
    func postRequestLogin(propertyName:String, PropertyType:String, propertyRating:String, completion: @escaping (ModelLogin?, Error?) -> Void) {
        
        let parameters = ["propertyName":propertyName, "PropertyType":PropertyType, "propertyRating":propertyRating ]
        let url = URL(string: "https://api.hotelratna.com/api/createProperty")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                
                return
            }
            
            do {
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                let model = try JSONDecoder().decode(ModelLogin.self, from: data)
                print(json)
                completion(model, nil)
            } catch let error {
                print(error.localizedDescription)
                print(error)
                completion(nil, error)
            }
        })
        
        task.resume()
    }
    
    
    
    func imagePick() {
        var config1 = PHPickerConfiguration()
        config1.selectionLimit = 8
        let phpPickerVC = PHPickerViewController(configuration: config1)
        phpPickerVC.delegate = self
        self.present(phpPickerVC, animated: true)
    }
    
    // MARK: - Action
    @IBAction func bigAddImageBtnPressed(_ sender: UIButton) {
    }
    @IBAction func addImageBtnPressed(_ sender: UIButton) {
        
        if bedRoomSelect == true {
            imagePick()
        } else {
            var config = PHPickerConfiguration()
            config.selectionLimit = 8
            let phpPickerVC = PHPickerViewController(configuration: config)
            phpPickerVC.delegate = self
            self.present(phpPickerVC, animated: true)
        }
    }
    @IBAction func btnBackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func BtnSavePressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewRoomTypeVC") as! NewRoomTypeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extension
extension CreatePropertyStap3VC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
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
            heightDimension: .fractionalWidth(1/6))
        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2.5,leading: 2.5,bottom: 2.5,trailing: 2.5
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: fullPhotoItem,
            count: 6
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [createSectionHeader()]
        return section
    }
    
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CreatePropertyHeaderCell", for: indexPath) as! CreatePropertyHeaderCell
            return reusableview
            
            
        default:
            fatalError("Unexpected element kind")
            //return UICollectionReusableView()
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionsData[section].images.count
     
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionData = sectionsData[indexPath.section]
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreatePropertyHeaderTwoCollectionViewCell", for: indexPath) as! CreatePropertyHeaderTwoCollectionViewCell
            cell.delegate = self
            cell.section = indexPath.section
            // Configure cell with data from sectionData.images
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreatePropertyHeaderTwoCollectionViewCell", for: indexPath) as! CreatePropertyHeaderTwoCollectionViewCell
            cell.delegate = self
            cell.section = indexPath.section
            // Configure cell with data from sectionData.images
            return cell
        }
        
        // Handle other sections or return a default cell if needed
        return UICollectionViewCell()
    }
    
    
    
    
   
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return 2
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        if section == 0{
    //            return arrImage.count
    //        } else if section == 1 {
    //            return arrImageBadRoom.count
    //        }
    //        return 0
    //    }
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        if indexPath.section == 0{
    //            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyProfileCollectionCell", for: indexPath) as? PropertyProfileCollectionCell else{
    //                return UICollectionViewCell()
    //            }
    //            cell.imagePhote.image = arrImage[indexPath.row]
    //            return cell
    //        } else {
    //            bedRoomSelect = true
    //            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyProfileCollectionCell", for: indexPath) as? PropertyProfileCollectionCell else{
    //                return UICollectionViewCell()
    //            }
    //            cell.imagePhote.image = arrImageBadRoom[indexPath.row]
    //            return cell
    //        }
    //    }
    
}


extension CreatePropertyStap3VC:PHPickerViewControllerDelegate, CellDelegate{
    func addButtonTapped(in section: Int) {
           // Present PHPickerViewController when the "Add" button is tapped
           var configuration = PHPickerConfiguration()
           configuration.filter = .images
           let picker = PHPickerViewController(configuration: configuration)
           picker.delegate = self
           present(picker, animated: true, completion: nil)
       }

       // MARK: - PHPickerViewControllerDelegate

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        let section = picker.view.tag
        
        // Ensure section is not nil
        guard section != nil else {
            return
        }
        
        for result in results {
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    if let image = image as? UIImage, error == nil {
                        // Update the data source with the new image
                        self?.sectionsData[section].images.append(image)
                        
                        // Reload the respective section in the collection view
                        DispatchQueue.main.async {
                            self?.createPropertyCollectionCell.reloadSections(IndexSet(integer: section))
                        }
                    }
                }
            }
        }
    }
}
