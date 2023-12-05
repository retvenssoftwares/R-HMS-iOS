//
//  DeluxeAPVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 09/11/23.
//

import UIKit

class DeluxeAPVC: UIViewController {

    
    // MARK: - Outlet
    
    @IBOutlet weak var viewDeluxeRoom: UIView!
    @IBOutlet weak var viewSuperDeluxeRoom: UIView!
    @IBOutlet weak var viewVIPRoom: UIView!
    @IBOutlet weak var viewSupermeDeluxe: UIView!
    @IBOutlet weak var viewHotelID: UIView!
    @IBOutlet weak var viewSelectRoomType: UIView!
    @IBOutlet weak var viewMapped: UIView!
    @IBOutlet weak var viewOTA: UIView!
    @IBOutlet weak var viewRoomID: UIView!
    @IBOutlet weak var viewRateID: UIView!
    @IBOutlet weak var viewStatus: UIView!
    @IBOutlet weak var viewStatusOccupancy: UIView!
    @IBOutlet weak var viewMaxOccupancy: UIView!
    @IBOutlet weak var viewMaxAdults: UIView!
    @IBOutlet weak var viewMaxChild: UIView!
    @IBOutlet weak var viewRatePlane: UIView!
    @IBOutlet weak var viewExtraRate: UIView!
    @IBOutlet weak var viewExtraChildRate: UIView!
    @IBOutlet weak var lblRoomType: CustomLabel!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSelectRoomType.isHidden = true
       
        
    }
    

    // MARK: - Function
    
   

    @IBAction func SelectRoomBtnPressed(_ sender: UIButton) {
        viewSelectRoomType.isHidden = false
        
    }
    @IBAction func deluxeBtnPressed(_ sender: UIButton) {
        lblRoomType.text = "Deluxe Room"
        viewSelectRoomType.isHidden = true
        viewDeluxeRoom.backgroundColor = UIColor.sementController
        if viewDeluxeRoom.backgroundColor == UIColor.sementController{
            viewSupermeDeluxe.backgroundColor = .white
            viewVIPRoom.backgroundColor = .white
            viewSupermeDeluxe.backgroundColor = .white
            viewHotelID.backgroundColor = .white
        }
        
    }
    @IBAction func superDeluxeRoomBtnPressed(_ sender: UIButton) {
        lblRoomType.text = "Super Deluxe Room"
        viewSelectRoomType.isHidden = true
        viewSupermeDeluxe.backgroundColor = UIColor.sementController
        
        if viewSupermeDeluxe.backgroundColor == UIColor.sementController{
            viewDeluxeRoom.backgroundColor = .white
            viewVIPRoom.backgroundColor = .white
            viewSupermeDeluxe.backgroundColor = .white
            viewHotelID.backgroundColor = .white
        }
    }
    @IBAction func vipRoomBtnPressed(_ sender: UIButton) {
        lblRoomType.text = "VIP Room"
        viewSelectRoomType.isHidden = true
        viewVIPRoom.backgroundColor = UIColor.sementController
        
        if viewVIPRoom.backgroundColor == UIColor.sementController{
            viewSupermeDeluxe.backgroundColor = .white
            viewDeluxeRoom.backgroundColor = .white
            viewSupermeDeluxe.backgroundColor = .white
            viewHotelID.backgroundColor = .white
        }
    }
    @IBAction func supermeDeluxe(_ sender: UIButton) {
        lblRoomType.text = "Superme Deluxe"
        viewSelectRoomType.isHidden = true
        viewSupermeDeluxe.backgroundColor = UIColor.sementController
        
        if viewSupermeDeluxe.backgroundColor == UIColor.sementController{
            viewDeluxeRoom.backgroundColor = .white
            viewVIPRoom.backgroundColor = .white
            viewSupermeDeluxe.backgroundColor = .white
            viewHotelID.backgroundColor = .white
        }
    }
    @IBAction func hotelIDBtnPressed(_ sender: UIButton) {
        lblRoomType.text = "Hotel ID"
        viewSelectRoomType.isHidden = true
        viewHotelID.backgroundColor = UIColor.sementController
        
        if viewHotelID.backgroundColor == UIColor.sementController{
            viewDeluxeRoom.backgroundColor = .white
            viewVIPRoom.backgroundColor = .white
            viewSupermeDeluxe.backgroundColor = .white
            viewHotelID.backgroundColor = .white
        }
    }
}
