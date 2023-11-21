//
//  OverviewVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 08/11/23.
//

import UIKit

class OverviewVC: UIViewController {

    
    // MARK: - Outlet
    @IBOutlet weak var overViewCollectionView: UICollectionView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
     hideKeyboardWhenTappedAround()
        overViewCollectionView.register(UINib(nibName: "OverViewCollectionCell", bundle: .main), forCellWithReuseIdentifier: "OverViewCollectionCell")
    }
    

   
    // MARK: - Navigation

 
}




// MARK: - Extension TableView
extension OverviewVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OverViewCollectionCell", for: indexPath) as! OverViewCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.5, height: 120)
    }
}
