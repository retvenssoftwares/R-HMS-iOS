//
//  OTASVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 08/11/23.
//

import UIKit

class OTASVC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var btnOverview: UIButton!
    @IBOutlet weak var btnMapping: UIButton!
    @IBOutlet weak var btnReservations: UIButton!
    @IBOutlet weak var btnLogo: UIButton!
    @IBOutlet weak var viewOverview: UIView!
    @IBOutlet weak var viewMapping: UIView!
    @IBOutlet weak var viewReservation: UIView!
    @IBOutlet weak var viewLogo: UIView!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView(storyBoard: "Main", controllerName: "OverviewVC")
        viewOverview.isHidden = false
        viewMapping.isHidden = true
        viewReservation.isHidden = true
        viewLogo.isHidden = true
    }
    
    // MARK: - Action
    @IBAction func overviewBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "OverviewVC")
        viewOverview.isHidden = false
        viewMapping.isHidden = true
        viewReservation.isHidden = true
        viewLogo.isHidden = true
        btnOverview.setTitleColor(UIColor.init(named: "SementController"), for: .normal)
    }
    @IBAction func mapingBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "MappingVC")
        viewMapping.isHidden = false
        viewOverview.isHidden = true
        viewReservation.isHidden = true
        viewLogo.isHidden = true
    }
    @IBAction func reservationBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "ArrivalsVC")
        viewReservation.isHidden = false
        viewMapping.isHidden = true
        viewOverview.isHidden = true
        viewLogo.isHidden = true
    }
    @IBAction func logoBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "LogsVC")
        viewLogo.isHidden = false
        viewMapping.isHidden = true
        viewReservation.isHidden = true
        viewOverview.isHidden = true
    }
    
}

// MARK: - Extension SegmentController
extension OTASVC{
    func addSubView(storyBoard:String,controllerName:String){
        containerView.subviews.forEach({ $0.removeFromSuperview() })
        let storyBoard = UIStoryboard(name: storyBoard, bundle: nil)
        let showVC = storyBoard.instantiateViewController(withIdentifier: "\(controllerName)")
        showVC.view.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        containerView.addSubview(showVC.view)
        self.addChild(showVC)
    }
}
