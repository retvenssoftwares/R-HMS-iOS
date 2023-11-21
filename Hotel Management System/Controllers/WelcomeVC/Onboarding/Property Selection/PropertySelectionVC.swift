//
//  PropertySelectionVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 05/11/23.
//

import UIKit

class PropertySelectionVC: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var viewSideMenu: UIView!
    @IBOutlet weak var viewPropertyChain: UIView!
    @IBOutlet weak var viewSingleProperty: UIView!
    
    var isSideViewOpen: Bool = false
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuTableView.allowsSelection = true
        viewSideMenu.isHidden = true
        self.navigationItem.backBarButtonItem?.isHidden = true
        //sideMenuTableView.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false
        hideKeyboardWhenTappedAround()
        sideMenuTableView.register(UINib(nibName: "SideMenuTableCell", bundle: nil), forCellReuseIdentifier: "SideMenuTableCell")

        navigationController?.navigationBar.isHidden = false
       
        viewPropertyChain.layer.cornerRadius = 10
        viewPropertyChain.layer.borderWidth = 1
        viewPropertyChain.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
       
        viewSingleProperty.layer.cornerRadius = 10
        viewSingleProperty.layer.borderWidth = 1
        viewSingleProperty.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
    }
    

    // MARK: - Action
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

   
    @IBAction func propertyChainBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func singlePropertyBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingSingleProperty1VC") as! OnboardingSingleProperty1VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func sideMenuBtnPressed(_ sender: UIButton) {
        sideMenuTableView.isHidden = false
        viewSideMenu.isHidden = false
        self.view.bringSubviewToFront(viewSideMenu)
//        if !isSideViewOpen{
//            isSideViewOpen = true//0
//            viewSideMenu.frame = CGRect(x: 0, y: 88, width: 0, height: 499)
//            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 0, height: 499)
//            UIView.setAnimationDuration(0.3)
//            UIView.setAnimationDelegate(self)
//            UIView.beginAnimations("TableAnimation", context: nil)//1
//            viewSideMenu.frame = CGRect(x: 0, y: 88, width: 259, height: 499)
//            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 259, height: 499)
//            UIView.commitAnimations()
//            
//        }else{
//            sideMenuTableView.isHidden = true
//            viewSideMenu.isHidden = true
//            isSideViewOpen = false
//            viewSideMenu.frame = CGRect(x: 0, y: 88, width: 259, height: 499)
//            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 259, height: 499)
//            UIView.setAnimationDuration(0.3)
//            UIView.setAnimationDelegate(self)
//            UIView.beginAnimations("TableAnimation", context: nil)
//            viewSideMenu.frame = CGRect(x: 0, y: 88, width: 0, height: 499)
//            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 0, height: 499)
//            UIView.commitAnimations()
//        }
    }
    @IBAction func sideMenuBackBtnPressed(_ sender: UIButton) {
        viewSideMenu.isHidden = true
    }
}



extension PropertySelectionVC:UITableViewDelegate,UITableViewDataSource{
    
    
    
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
    
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChargesPlanes1VC") as! ChargesPlanes1VC
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
