//
//  VerificationPandingVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 05/11/23.
//

import UIKit

class VerificationPandingVC: UIViewController {

    @IBOutlet weak var verifactionPandingCOllectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        verifactionPandingCOllectionView.register(UINib(nibName: "VerificationPandingCollectionView", bundle: .main), forCellWithReuseIdentifier: "VerificationPandingCollectionView")
    }
    

    
    func gotoDashBoardBtnTapeed(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingScreenVC") as! OnboardingScreenVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
  

}


extension VerificationPandingVC:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerificationPandingCollectionView", for: indexPath) as! VerificationPandingCollectionView
        cell.setDataPandingCell(section: indexPath.row)
        cell.gotoDashBoardbtnClicked = { [weak self] in
            self?.gotoDashBoardBtnTapeed()
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)

      }
    
}
