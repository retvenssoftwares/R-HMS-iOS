//
//  CreateRoom2VC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 04/11/23.
//

import UIKit

class CreateRoom2VC: UIViewController {

    @IBOutlet weak var CreateRoomCollectioCell: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        CreateRoomCollectioCell.register(UINib(nibName: "PropertyProfileCollectionCell", bundle: .main), forCellWithReuseIdentifier: "PropertyProfileCollectionCell")
        CreateRoomCollectioCell.register(UINib(nibName: "CreateRoomHeaderCell", bundle: .main), forCellWithReuseIdentifier: "CreateRoomHeaderCell")
        self.CreateRoomCollectioCell.register(UINib(nibName: "CreateRoomFooterCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "CreateRoomFooterCell")
        CreateRoomCollectioCell.collectionViewLayout = createCompositionalLayout()
    }
    

    

}


extension CreateRoom2VC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func createCompositionalLayout() -> UICollectionViewLayout {
               let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
                   if sectionIndex == 0{
                       return self.generateChatModule2()
                   } else if sectionIndex == 1{
                       return self.generateChatModule()
                   }else if sectionIndex == 2 {
                       return self.generateChatModule2()
                   }
                   else if sectionIndex == 3 {
                       return self.generateChatModule()
                   }
                   else if sectionIndex == 4 {
                       return self.generateChatModule2()
                   }
                   else if sectionIndex == 5 {
                       return self.generateChatModule()
                   }
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
               section.boundarySupplementaryItems = [createSectionFooter()]
               return section
           }
    
    
    func generateChatModule2() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(20)))
        //item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    func createSectionFooter() -> NSCollectionLayoutBoundarySupplementaryItem {
            let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(20))
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
            return layoutSectionHeader
        }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
       switch kind {
                
        case UICollectionView.elementKindSectionFooter:
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CreateRoomFooterCell", for: indexPath) as! CreateRoomFooterCell
           footerView.setData(section: indexPath.section)
           
                return footerView
                
         default:
                assert(false, "Unexpected element kind")
        }
    }
    
    
   

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else if section == 1{
            return 6
        }
        else if section == 2{
            return 1
        }
        else if section == 3{
            return 6
        }else if section == 4{
            return 1
        }else if section == 5{
            return 6
        }
        return 1
    }
    
  
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateRoomHeaderCell", for: indexPath) as! CreateRoomHeaderCell
            cell.setData(section: indexPath.section)
            return cell
        } else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyProfileCollectionCell", for: indexPath) as! PropertyProfileCollectionCell
            return cell
        } else if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateRoomHeaderCell", for: indexPath) as! CreateRoomHeaderCell
            cell.setData(section: indexPath.section)
            return cell
        }else if indexPath.section == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyProfileCollectionCell", for: indexPath) as! PropertyProfileCollectionCell
            return cell
        }else if indexPath.section == 4{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateRoomHeaderCell", for: indexPath) as! CreateRoomHeaderCell
            cell.setData(section: indexPath.section)
            return cell
        }else if indexPath.section == 5{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyProfileCollectionCell", for: indexPath) as! PropertyProfileCollectionCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyProfileCollectionCell", for: indexPath) as! PropertyProfileCollectionCell
        return cell
    }
   

    
}
