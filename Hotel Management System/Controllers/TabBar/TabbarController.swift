//
//  TabbarController.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 09/11/23.
//

import UIKit

class TabbarController: UIViewController {

    @IBOutlet weak var viewCointainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
       addSubView(storyBoard: "Main", controllerName: "OnboardingScreenVC")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func tabbarbtnPressed(_ sender: UIButton) {
        if sender.tag == 1{
            addSubView(storyBoard: "Main", controllerName: "OnboardingScreenVC")
        }
        if sender.tag == 2{
            addSubView(storyBoard: "Main", controllerName: "PropertProfileVC")
           
        }
        if sender.tag == 3{
            addSubView(storyBoard: "Main", controllerName: "ChannelsVC")
           
        }
        if sender.tag == 4{
            addSubView(storyBoard: "Main", controllerName: "ReservationsVC")
        }
        
        if sender.tag == 5{
            addSubView(storyBoard: "Main", controllerName: "CreateRoomVC")
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
