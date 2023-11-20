//
//  ReservationsVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 06/11/23.
//

import UIKit

class ReservationsVC: UIViewController {
    
    // MARK: - Outlet

    @IBOutlet weak var btnCancelled: UIButton!
    @IBOutlet weak var btnUpcoming: UIButton!
    @IBOutlet weak var btnDepartues: UIButton!
    @IBOutlet weak var btnArrivals: UIButton!
    @IBOutlet weak var viewCancelled: UIView!
    @IBOutlet weak var viewUpcoming: UIView!
    @IBOutlet weak var viewDepartues: UIView!
    @IBOutlet weak var viewArrivals: UIView!
    @IBOutlet weak var containerView: UIView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubView(storyBoard: "Main", controllerName: "ArrivalsVC")
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        viewArrivals.isHidden = false
        viewUpcoming.isHidden = true
        viewDepartues.isHidden = true
        viewCancelled.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
       
       
   
    
   
        let color = UIColor.init(named: "SementController")
        btnArrivals.setTitleColor(color, for: .normal)
//        btnArrivals.setTitleColor(.black, for: .normal)
//        btnArrivals.setTitleColor(.black, for: .normal)
//        btnArrivals.setTitleColor(.black, for: .normal)
      
    }
    
    
    // MARK: - Action
    @IBAction func arrivalsBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "ArrivalsVC")
        
        viewUpcoming.isHidden = true
        viewDepartues.isHidden = true
        viewCancelled.isHidden = true
        viewArrivals.isHidden = false
        let color = UIColor.init(named: "SementController")
        btnArrivals.setTitleColor(color, for: .normal)
        btnArrivals.setTitleColor(.black, for: .normal)
        btnArrivals.setTitleColor(.black, for: .normal)
        btnArrivals.setTitleColor(.black, for: .normal)
        
        
        
    }
    @IBAction func departuesBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "DepartuesVC")
        viewUpcoming.isHidden = true
        viewDepartues.isHidden = false
        viewCancelled.isHidden = true
        viewArrivals.isHidden = true
     
        let color = UIColor.init(named: "SementController")
        btnDepartues.setTitleColor(color, for: .normal)
        btnArrivals.setTitleColor(.black, for: .normal)
        btnUpcoming.setTitleColor(.black, for: .normal)
        btnCancelled.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func upcomimgBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "UpcomingVC")
        viewUpcoming.isHidden = false
        viewDepartues.isHidden = true
        viewCancelled.isHidden = true
        viewArrivals.isHidden = true
        let color = UIColor.init(named: "SementController")
        btnUpcoming.setTitleColor(color, for: .normal)
        btnArrivals.setTitleColor(.black, for: .normal)
        btnUpcoming.setTitleColor(.black, for: .normal)
        btnDepartues.setTitleColor(.black, for: .normal)
       
        
        

    }
    @IBAction func cancelledBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "CancelledVC")
        viewUpcoming.isHidden = true
        viewDepartues.isHidden = true
        viewCancelled.isHidden = false
        viewArrivals.isHidden = true
        let color = UIColor.init(named: "SementController")
        btnCancelled.setTitleColor(color, for: .normal)
        btnArrivals.setTitleColor(.black, for: .normal)
        btnUpcoming.setTitleColor(.black, for: .normal)
        btnUpcoming.setTitleColor(.black, for: .normal)
    }
    
}


// MARK: - Extension TableView

extension ReservationsVC{
    func addSubView(storyBoard:String,controllerName:String){
        containerView.subviews.forEach({ $0.removeFromSuperview() })
        let storyBoard = UIStoryboard(name: storyBoard, bundle: nil)
        let showVC = storyBoard.instantiateViewController(withIdentifier: "\(controllerName)")
        showVC.view.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        containerView.addSubview(showVC.view)
        
        self.addChild(showVC)
    }
}
