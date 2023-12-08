//
//  PropertySelectionVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 05/11/23.
//

import UIKit

class PropertySelectionVC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var viewPropertyChain: UIView!
    @IBOutlet weak var viewSingleProperty: UIView!
    var propertyTypeSOC: String = "Unknown"
    @IBOutlet weak var propertyChainBtn: UIButton!
    @IBOutlet weak var singlePropertyBtn: UIButton!
    var isSideViewOpen: Bool = false
    let apiUrl = URL(string: "https://api.hotelratna.com/api/userEdit")!
    var singleProperty: String = "Single"
    var multipleProperty: String = "Multiple"
    var userId: String?
    
    var userDefaults = UserDefaults()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.backBarButtonItem?.isHidden = false
        hideKeyboardWhenTappedAround()
        //sideMenuTableView.register(UINib(nibName: "SideMenuTableCell", bundle: nil), forCellReuseIdentifier: "SideMenuTableCell")
        self.navigationItem.backButtonTitle = ""
        //navigationController?.navigationBar.isHidden = false
        viewPropertyChain.layer.cornerRadius = 10
        viewPropertyChain.layer.borderWidth = 1
        viewPropertyChain.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewSingleProperty.layer.cornerRadius = 10
        viewSingleProperty.layer.borderWidth = 1
        viewSingleProperty.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        navigationItem.backButtonTitle = ""
        if let userId = userId {
            print(userId)
            userDefaults.setValue(userId, forKey: "userId")
        }
    }
    
    
    
    // MARK: - Action
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    @IBAction func propertyChainBtnPressed(_ sender: UIButton) {
        if propertyChainBtn.isEnabled == true {
            viewPropertyChain.layer.borderColor = UIColor.green.cgColor
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingPropertyChain1VC") as! OnboardingPropertyChain1VC
            multipleProperty = "Multiple"
            vc.userId = userId
            vc.multipleProperty = multipleProperty
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            viewPropertyChain.layer.borderColor = UIColor.textFiledViewLine.cgColor
        }
    }
    
   
    
    @IBAction func singlePropertyBtnPressed(_ sender: UIButton) {
        //updatePropertyTypeSOC(for: "single")
        if singlePropertyBtn.isEnabled == true {
            viewSingleProperty.layer.borderColor = UIColor.green.cgColor
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SingleProperty1VC") as! SingleProperty1VC
            vc.userId = userId
            vc.property = singleProperty
            //clickBtnResponse()
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            viewSingleProperty.layer.borderColor = UIColor.textFiledViewLine.cgColor
        }
    }
}

//extension PropertySelectionVC:UITableViewDelegate,UITableViewDataSource{
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 8
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTable", for: indexPath) as! SideMenuTable
//        cell.setDataSideTable(no: indexPath.row)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0 {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChargesPlanes1VC") as! ChargesPlanes1VC
//            self.navigationController?.pushViewController(vc, animated:true)
//        }
//        else if indexPath.row == 1 {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RatesAndInventoryVC") as! RatesAndInventoryVC
//            self.navigationController?.pushViewController(vc, animated:true)
//        }
//        else if indexPath.row == 2 {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuickReservationsVC") as! QuickReservationsVC
//            self.navigationController?.pushViewController(vc, animated:true)
//        }
//        else if indexPath.row == 3 {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChannelsVC") as! ChannelsVC
//            self.navigationController?.pushViewController(vc, animated:true)
//        }
//        else if indexPath.row == 4 {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewAllPropertyVC") as! ViewAllPropertyVC
//            self.navigationController?.pushViewController(vc, animated:true)
//        }
//        else if indexPath.row == 5 {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReservationsVC") as! ReservationsVC
//            self.navigationController?.pushViewController(vc, animated:true)
//        }
//        else if indexPath.row == 6 {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateRatePlaneVC") as! CreateRatePlaneVC
//            self.navigationController?.pushViewController(vc, animated:true)
//        }
//        else if indexPath.row == 7 {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogsVC") as! LogsVC
//            self.navigationController?.pushViewController(vc, animated:true)
//        }
//    }
//}
