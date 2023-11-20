//
//  VerificationPendingViewController.swift
//  Hotel Management System
//
//  Created by mayur bobade on 16/11/23.
//

import UIKit

class VerificationPendingViewController: UIViewController {

    @IBOutlet weak var verificationCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        verificationCollectionView.register(UINib(nibName: "VerificationDoneCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "VerificationPandingCollectionView")
    }
    
    func gotoDashBoardBtnTapeed(){
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingScreenVC") as! OnboardingScreenVC
//        self.navigationController?.pushViewController(vc, animated: true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabbarController") as! TabbarController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension VerificationPendingViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
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
