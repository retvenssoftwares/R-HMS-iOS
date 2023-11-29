//
//  SideMenuVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 18/11/23.
//

import UIKit

class SideMenuVC: UIViewController {

    
    // MARK: - Outlet
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var viewSideMneu: UIView!
    
    
//    var isSideViewOpen: Bool = false
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        sideMenuTableView.allowsSelection = true
        viewSideMneu.isHidden = true
        //sideMenuTableView.backgroundColor = UIColor.groupTableViewBackground
//        isSideViewOpen = false

        
        sideMenuTableView.register(UINib(nibName: "SideMenuTableCell", bundle: nil), forCellReuseIdentifier: "SideMenuTableCell")
        viewSideMneu.isHidden = true

    }
    

  
    // MARK: - Action

   
    @IBAction func sideMenuBtnPressed(_ sender: UIButton) {
        sideMenuTableView.isHidden = false
        viewSideMneu.isHidden = false
        self.view.bringSubviewToFront(viewSideMneu)
    }
    
}

// MARK: - Extension TableView
extension SideMenuVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableCell", for: indexPath) as! SideMenuTableCell
        cell.setDataSideTable(no: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
    
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingScreenVC") as! OnboardingScreenVC
        self.navigationController?.pushViewController(vc, animated:true)
       }
        else if indexPath.row == 1 {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RatesAndInventoryVC") as! RatesAndInventoryVC
        self.navigationController?.pushViewController(vc, animated:true)
       }
        else if indexPath.row == 2 {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuickReservationsVC") as! QuickReservationsVC
        self.navigationController?.pushViewController(vc, animated:true)
       }
        else if indexPath.row == 3 {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChannelsVC") as! ChannelsVC
        self.navigationController?.pushViewController(vc, animated:true)
       }
        else if indexPath.row == 4 {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewAllPropertyVC") as! ViewAllPropertyVC
        self.navigationController?.pushViewController(vc, animated:true)
       }
        else if indexPath.row == 5 {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReservationsVC") as! ReservationsVC
        self.navigationController?.pushViewController(vc, animated:true)
       }
        else if indexPath.row == 6 {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateRatePlaneVC") as! CreateRatePlaneVC
        self.navigationController?.pushViewController(vc, animated:true)
       }
        else if indexPath.row == 7 {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogsVC") as! LogsVC
        self.navigationController?.pushViewController(vc, animated:true)
       }
      

    }
  
    
}
