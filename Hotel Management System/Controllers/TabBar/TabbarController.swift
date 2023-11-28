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
        self.navigationItem.backBarButtonItem?.isHidden = true
        hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.isHidden = true
       addSubView(storyBoard: "Main", controllerName: "DashboradVC")
        let image1 = UIImage(named: "Tabbar1")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image1)
        imageView.tintColor = UIColor.white
        let image2 = UIImage(named: "Tabbar2")?.withRenderingMode(.alwaysTemplate)
        let imageView2 = UIImageView(image: image2)
        imageView2.tintColor = UIColor.white
        let image3 = UIImage(named: "Tabbar3")?.withRenderingMode(.alwaysTemplate)
        let imageView3 = UIImageView(image: image3)
        imageView3.tintColor = UIColor.white
        let image4 = UIImage(named: "Tabbar4")?.withRenderingMode(.alwaysTemplate)
        let imageView4 = UIImageView(image: image4)
        imageView4.tintColor = UIColor.white
        let image5 = UIImage(named: "Tabbar5")?.withRenderingMode(.alwaysTemplate)
        let imageView5 = UIImageView(image: image5)
        imageView5.tintColor = UIColor.white
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func tabbarbtnPressed(_ sender: UIButton) {
        if sender.tag == 1{
            let image = UIImage(named: "Tabbar1")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor.systemBlue
            addSubView(storyBoard: "Main", controllerName: "DashboradVC")
        } else {
            let image = UIImage(named: "Tabbar1")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor.white
        }
        if sender.tag == 2{
            let image = UIImage(named: "Tabbar2")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor.systemBlue
            addSubView(storyBoard: "Main", controllerName: "PropertProfileVC")
           
        } else {
            let image = UIImage(named: "Tabbar2")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor.white
        }
        if sender.tag == 3{
            let image = UIImage(named: "Tabbar3")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor.systemBlue
            addSubView(storyBoard: "Main", controllerName: "ChannelsVC")
           
        } else {
            let image = UIImage(named: "Tabbar3")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor.white
        }
        if sender.tag == 4{
            let image = UIImage(named: "Tabbar4")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor.systemBlue
            addSubView(storyBoard: "Main", controllerName: "ReservationsVC")
        } else {
            let image = UIImage(named: "Tabbar4")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor.white
        }
        
        if sender.tag == 5{
            let image = UIImage(named: "Tabbar5")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor.systemBlue
            addSubView(storyBoard: "Main", controllerName: "CreateRoomVC")
        } else {
            let image = UIImage(named: "Tabbar5")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor.white
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
