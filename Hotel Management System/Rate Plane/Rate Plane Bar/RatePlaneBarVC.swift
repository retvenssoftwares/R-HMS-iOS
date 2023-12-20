//
//  RatePlaneBarVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 24/11/23.
//

import UIKit
import FittedSheets

class RatePlaneBarVC: UIViewController {

  
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnBar: UIButton!
    @IBOutlet weak var btnDiscount: UIButton!
    @IBOutlet weak var btnCompany: UIButton!
    @IBOutlet weak var btnPackage: UIButton!
    @IBOutlet weak var viewBar: UIView!
    @IBOutlet weak var viewCompany: UIView!
    @IBOutlet weak var viewDiscount: UIView!
    @IBOutlet weak var viewPackage: UIView!
    @IBOutlet weak var RatePlaneBarTableView: UITableView!
    var counter = 0
    var discountPage:Bool = false
    
    var filterdata:[String]!
    
    
    var arrDeluxeCP = ["Deluxe CP DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP"]
    
    var arrInclusion = ["Diwali Offer", "Holi Offer", "New Year Offer", "Diwali Offer", "Holi Offer", "New Year Offer","Diwali Offer", "Holi Offer", "Holi Offer"]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textFieldInsideSearchBar = self.searchBar.value(forKey: "searchField") as! UITextField
         textFieldInsideSearchBar.font = UIFont(name: "Roboto-Medium-", size: 13)
        filterdata = arrDeluxeCP
        RatePlaneBarTableView.register(UINib(nibName: "ChargesAndPlanesTableCell", bundle: nil), forCellReuseIdentifier: "ChargesAndPlanesTableCell")
        RatePlaneBarTableView.register(UINib(nibName: "InventoryTableCell", bundle: nil), forCellReuseIdentifier: "InventoryTableCell")
    }
    
    @IBAction func btnBarPressed(_ sender: UIButton) {
    }
    @IBAction func btnDiscountPressed(_ sender: UIButton) {
        if btnDiscount.isEnabled == true {
            counter += 1
        } else {
            counter = 0
        }
        
    }
    @IBAction func btnCompanyPressed(_ sender: UIButton) {
        
    }
    @IBAction func btnPackage(_ sender: UIButton) {
       
    }
    
    func deleteItem(at indexPath: IndexPath) {
        arrDeluxeCP.remove(at: indexPath.row)
        RatePlaneBarTableView.deleteRows(at: [indexPath], with: .fade)
        DispatchQueue.main.async {
            self.RatePlaneBarTableView.reloadData()
        }
    }

    @IBAction func filterBtnPressed(_ sender: UIButton) {
    }
}




extension RatePlaneBarVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if counter == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChargesAndPlanesTableCell", for: indexPath) as! ChargesAndPlanesTableCell
            if discountPage == true{
                cell.txtFieldDeluxeCP.text = arrInclusion[indexPath.row]
            }
            cell.txtFieldDeluxeCP.text = arrDeluxeCP[indexPath.row]
            if filterdata.count != 0
            {
                cell.txtFieldDeluxeCP.text = filterdata[indexPath.row]
            }
            else{
                cell.txtFieldDeluxeCP.text = arrDeluxeCP[indexPath.row]
            }
            cell.deleteBtnClicked = {[weak self] in
                self?.deleteItem(at: indexPath)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryTableCell", for: indexPath) as! InventoryTableCell
            if discountPage == true{
                //cell.txtFieldDeluxeCP.text = arrInclusion[indexPath.row]
            }
//            cell.txtFieldDeluxeCP.text = arrDeluxeCP[indexPath.row]
//            if filterdata.count != 0
//            {
//                cell.txtFieldDeluxeCP.text = filterdata[indexPath.row]
//            }
//            else{
//                cell.txtFieldDeluxeCP.text = arrDeluxeCP[indexPath.row]
//            }
//            cell.deleteBtnClicked = {[weak self] in
//                self?.deleteItem(at: indexPath)
//            }
            return cell
           
        }
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "ChargesAndPlanesTableCell", for: indexPath) as! ChargesAndPlanesTableCell
        return cell1
    }
    
    @objc func addCell(_ sender: UIButton) {
        
    }
    
    
    
}


extension RatePlaneBarVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
               filterdata = searchText.isEmpty ? arrDeluxeCP : arrDeluxeCP.filter { $0.contains(searchText) }
        RatePlaneBarTableView.reloadData()
        
       }
}
