//
//  CreatePropertyStap3VC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 17/11/23.
//

import UIKit

class CreatePropertyStap3VC: UIViewController {

    @IBOutlet weak var createPropertyCollectionCell: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        createPropertyCollectionCell.register(UINib(nibName: "PropertyProfileCollectionCell", bundle: .main), forCellWithReuseIdentifier: "PropertyProfileCollectionCell")
        self.createPropertyCollectionCell.register(UINib(nibName: "CreatePropertyHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CreatePropertyHeaderCell")
        createPropertyCollectionCell.collectionViewLayout = createCompositionalLayout()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension CreatePropertyStap3VC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
//    
//     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        switch kind {
//        case UICollectionView.elementKindSectionHeader:
//            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CreatePropertyHeaderCell", for: indexPath) as! CreatePropertyHeaderCell
//                return reusableview
//
//
//        default:  fatalError("Unexpected element kind")
//            return UICollectionReusableView()
//            
//        }
//        
//    }

    
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
            let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(20))
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
            return layoutSectionHeader
        }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyProfileCollectionCell", for: indexPath) as! PropertyProfileCollectionCell
        return cell
    }

}
