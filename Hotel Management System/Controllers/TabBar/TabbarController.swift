//
//  TabbarController.swift
//  Hotel Management System
//
//  Created by mayur bobade on 09/11/23.
//

import UIKit

class TabbarController: UIViewController {

    @IBOutlet weak var viewCointainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tabbarbtnPressed(_ sender: UIButton) {
        if sender.tag == 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingScreenVC") as! OnboardingScreenVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if sender.tag == 2 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RatesAndInventoryVC") as! RatesAndInventoryVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if sender.tag == 3 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChannelsVC") as! ChannelsVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if sender.tag == 4 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReservationVC") as! ReservationVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if sender.tag == 5 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddAmenityVC") as! AddAmenityVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension TabbarController{
    func addSubView(storyBoard:String,controllerName:String){
        viewCointainer.subviews.forEach({ $0.removeFromSuperview() })
        let storyBoard = UIStoryboard(name: storyBoard, bundle: nil)
        let showVC = storyBoard.instantiateViewController(withIdentifier: "\(controllerName)")
        showVC.view.frame = CGRect(x: 0, y: 0, width: self.viewCointainer.frame.size.width, height: self.viewCointainer.frame.size.height)
        viewCointainer.addSubview(showVC.view)
        
        self.addChild(showVC)
    }
}
