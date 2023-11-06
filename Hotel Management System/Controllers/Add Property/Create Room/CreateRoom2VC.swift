//
//  CreateRoom2VC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 04/11/23.
//

import UIKit

class CreateRoom2VC: UIViewController {

    @IBOutlet weak var CreateRoomCollectioCell: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        CreateRoomCollectioCell.register(UINib(nibName: "PropertyProfileCollectionCell", bundle: .main), forCellWithReuseIdentifier: "PropertyProfileCollectionCell")
        CreateRoomCollectioCell.register(UINib(nibName: "CreateRoomHeaderCell", bundle: .main), forCellWithReuseIdentifier: "CreateRoomHeaderCell")
        CreateRoomCollectioCell.register(UINib(nibName: "FooterCell", bundle: .main), forCellWithReuseIdentifier: "FooterCell")
        
        self.CreateRoomCollectioCell.register(UINib(nibName: "FooterCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FooterCell")
    }
    

    

}


extension CreateRoom2VC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
       switch kind {
                
        case UICollectionView.elementKindSectionFooter:
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterCell", for: indexPath)
           
                return footerView
                
         default:
                assert(false, "Unexpected element kind")
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateRoomHeaderCell", for: indexPath) as! CreateRoomHeaderCell
            cell.setData(section: indexPath.section)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyProfileCollectionCell", for: indexPath) as! PropertyProfileCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.frame.width, height: 20)
        }
        return CGSize(width: collectionView.frame.width/4, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        
            return UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
        
        }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateRatePlanVC") as! CreateRatePlaneVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
