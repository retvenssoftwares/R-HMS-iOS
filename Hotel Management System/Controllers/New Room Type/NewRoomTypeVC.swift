//
//  NewRoomTypeVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 14/11/23.
//

import UIKit

class NewRoomTypeVC: UIViewController {

    @IBOutlet weak var newRoomTypeCollectionCell: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        newRoomTypeCollectionCell.register(UINib(nibName: "NewRoomTypeCollectionCell", bundle: .main), forCellWithReuseIdentifier: "NewRoomTypeCollectionCell")
        newRoomTypeCollectionCell.collectionViewLayout = createCompositionalLayout()
    }
    

   

}


extension NewRoomTypeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width/4, height: 50)
//    }
}
