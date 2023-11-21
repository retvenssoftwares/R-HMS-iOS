//
//  OnboardingScreenVC.swift
//  Retvent
//
//  Created by mayur bobade on 02/11/23.
//

import UIKit

class OnboardingScreenVC: UIViewController {

    @IBOutlet weak var onboardingCollectionCell: UICollectionView!
    
    
    var arrHeading = ["Let’s add your properties", "Let’s add rooms in properties", "Nothing to display"]
    var arrImg = ["EmptyChainImage","Emptydashborad","EmpltyTableImg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        onboardingCollectionCell.register(UINib(nibName: "OnboardingCollectionCell", bundle: .main), forCellWithReuseIdentifier: "OnboardingCollectionCell")
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

}


extension OnboardingScreenVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionCell", for: indexPath) as! OnboardingCollectionCell
        cell.lblHeading.text = arrHeading[indexPath.row]
        cell.imgBanner.image = UIImage(named: arrImg[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 500)

      }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
}
