//
//  WelcomeViewController.swift
//  Retvent
//
//  Created by Mayur Bobade on 01/11/23.
//

import UIKit
import PhotosUI
import FittedSheets

class WelcomeViewController: UIViewController, PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
    }
    
   
    
    
    

    // MARK: - Oulet
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var btnNext: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
   
       
    }
    
    func BottamSheet(){
        let bottomSheetVC = PropertyNamePop(nibName: "PropertyNamePop", bundle: nil)
        
                        // Customize presentation style as needed (e.g., .overCurrentContext, .overFullScreen)
                        bottomSheetVC.modalPresentationStyle = .overCurrentContext
                        present(bottomSheetVC, animated: true, completion: nil)
    }
  
    // MARK: - Action

    @IBAction func nextBtnPressed(_ sender: UIButton) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewRoomTypeVC") as! NewRoomTypeVC
//        self.navigationController?.pushViewController(vc, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AuthenticationVC") as! AuthenticationVC
        self.navigationController?.pushViewController(vc, animated: true)
//        
        
//
//        
        
        
     
//        let bottomSheetVC = PropertyTypePops(nibName: "PropertyTypePops", bundle: nil)
//                bottomSheetVC.modalPresentationStyle = .overCurrentContext
//                present(bottomSheetVC, animated: true, completion: nil)
//        bottomSheetVC.modalTransitionStyle = .coverVertical
//        let bottomSheetContent = Bundle.main.loadNibNamed("PropertyTypePops", owner: nil, options: nil)?.first as! PropertyTypePops
//
//               // Create a SheetViewController with the loaded content view
//               let sheetController = SheetViewController(controller: bottomSheetContent)
//
//               // Customize sheet appearance if needed
//               // ...
//
//               // Present the bottom sheet
//               present(sheetController, animated: false)
        
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewPropertyProfileVC") as! NewPropertyProfileVC
//        self.navigationController?.pushViewController(vc, animated: true)
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewPropertyProfileVC") as! NewPropertyProfileVC
//               self.navigationController?.pushViewController(vc, animated: true)
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChargesPlanes1VC") as! ChargesPlanes1VC
//               self.navigationController?.pushViewController(vc, animated: true)
        
        

//        var config = PHPickerConfiguration()
//        config.selectionLimit = 0
//        
//        let phPickerVC = PHPickerViewController(configuration: config)
//        phPickerVC.delegate = self
//        self.present(phPickerVC, animated: true)
//
//        let vc = PropertyTypePops()
//        if let sheet = vc.sheetPresentationController{
//            viewBg.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//            sheet.detents = [.medium()] // Sheet style
////            sheet.prefersScrollingExpandsWhenScrolledToEdge = false // Inside Scrolling
////            sheet.prefersGrabberVisible = true // Grabber button
//            sheet.preferredCornerRadius = 24 //
////            let pickerHeight: CGFloat = 300
////            let pickerWidth: CGFloat = viewBg.bounds.width
////            phPickerVC.view.frame = CGRect(x: 0, y: view.bounds.height - pickerHeight, width: pickerWidth, height: pickerHeight)
////        
//            
//          
//            sheet.largestUndimmedDetentIdentifier = .medium //Avoid dismiss
//            self.navigationController?.present(vc, animated: true)
//        }
//
   }
    
}


