//
//  CreateAmenityVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 03/11/23.
//

import UIKit
import iOSDropDown

class CreateAmenityVC: UIViewController {
    
    
    // MARK: - Outlet
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var txtFieldAmintyType: DropDown!
    @IBOutlet weak var viewSearchBar: UIView!
    @IBOutlet weak var viewAnemintyName: UIView!
    @IBOutlet weak var viewAnemityType: UIView!
    @IBOutlet weak var viewShortCode: UIView!
    var amenityData :[AmenityData] = []
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtFieldAmintyType.optionArray = ["HTYHB", "HYJKJKB", "TGDBC"]
        collectionview.register(UINib(nibName: "CreateAmenityCollectionCell", bundle: .main), forCellWithReuseIdentifier: "CreateAmenityCollectionCell")
        viewAnemintyName.layer.borderWidth = 1
        viewAnemintyName.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewAnemintyName.layer.cornerRadius = 10
        viewAnemityType.layer.borderWidth = 1
        viewAnemityType.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewAnemityType.layer.cornerRadius = 10
        viewShortCode.layer.borderWidth = 1
        viewShortCode.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewShortCode.layer.cornerRadius = 10
        viewSearchBar.layer.borderWidth = 1
        viewSearchBar.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewSearchBar.layer.cornerRadius = 10
        
        
    }
    
//    func getDesignationApiCalling(){
//        APIManager.shared.getAmenityData { result in
//            switch result {
//            case .success(let employee):
//                DispatchQueue.main.async {
//                    self.amenityData = employee.data
//                    self.collectionview.reloadData()
//                }
//            case .failure(let error):
//                print("API Call Failed. Error: \(error)")
//            }
//        }
//    }
    
    
}


//extension CreateAmenityVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return amenityData.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddAmenityCell", for: indexPath) as! AddAmenityCell
//
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width/7, height: 50)
//    }
//    
//}
