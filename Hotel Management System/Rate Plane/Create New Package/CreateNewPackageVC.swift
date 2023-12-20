//
//  CreateNewPackageVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 25/11/23.
//

import UIKit
import iOSDropDown

class CreateNewPackageVC: UIViewController {
    
    @IBOutlet weak var lblChargesDetails: UILabel!
    @IBOutlet weak var txtFieldROundUpDown: UITextField!
    @IBOutlet weak var txtFieldInclusionCharges: UITextField!
    @IBOutlet weak var txtFieldPackhageRate: UITextField!
    @IBOutlet weak var txtFieldMasterPlanes: UITextField!
    @IBOutlet weak var createNewPackageTableView: UITableView!
    @IBOutlet weak var txtFieldNights: DropDown!
    @IBOutlet weak var txtFIeldMasterOlaneDeluxeRoom: DropDown!
    @IBOutlet weak var txtFIeldPackageName: UITextField!
    @IBOutlet weak var txtFIeldRateCode: UITextField!
    
    var dataSource: [Int] = [1, 2, 3]
    var selectedIndexPath: IndexPath?
    var arrDeluxeCP = ["Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP"]
    var dataArray: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createNewPackageTableView.isHidden = true
        createNewPackageTableView.register(UINib(nibName: "ChargesAndPlanesTableCell", bundle: nil), forCellReuseIdentifier: "ChargesAndPlanesTableCell")
        
        DispatchQueue.main.async {
            self.createNewPackageTableView.reloadData()
        }
    }
    
    func deleteItem(at indexPath: IndexPath) {
        arrDeluxeCP.remove(at: indexPath.row)
        createNewPackageTableView.deleteRows(at: [indexPath], with: .fade)
        DispatchQueue.main.async {
            self.createNewPackageTableView.reloadData()
        }
    }
    
    func AddItem(at indexPath: IndexPath) {
//        arrDeluxeCP.append(arrDeluxeCP[indexPath.row])
//        createNewPackageTableView.insertRows(at: [IndexPath(row: arrDeluxeCP.count - 1, section: 0)], with: .automatic)
//        createNewPackageTableView.reloadRows(at: [indexPath], with: .fade)
//        DispatchQueue.main.async {
//            self.createNewPackageTableView.reloadData()
        //}
    }
    
    // MARK: - Navigation
    
    
    @IBAction func btnEditRoundUpDown(_ sender: UIButton) {
    }
    @IBAction func btnEditInclusionCharges(_ sender: UIButton) {
    }
    @IBAction func btnEditPackageRate(_ sender: UIButton) {
    }
    @IBAction func btnEditMasterPlanes(_ sender: UIButton) {
    }
    @IBAction func btnAddPressed(_ sender: UIButton) {
        createNewPackageTableView.isHidden = false
    }
    
}


extension CreateNewPackageVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChargesAndPlanesTableCell", for: indexPath) as! ChargesAndPlanesTableCell
        //cell.txtFieldDeluxeCP.text = arrDeluxeCP[indexPath.row]
        cell.editBtnClicked = {[weak self] in
            self?.AddItem(at: indexPath)
            //                        cell.txtField3600.isUserInteractionEnabled = true
            //                        cell.txtField6Inclusion.isUserInteractionEnabled = true
            //                        cell.txtFIeldRatePlaneTottal.isUserInteractionEnabled = true
            //                        cell.txtFieldDeluxeCP.isUserInteractionEnabled = true
        }
        cell.deleteBtnClicked = {[weak self] in
            self?.deleteItem(at: indexPath)
        }
        return cell
    }
    
    @objc func addCell(_ sender: UIButton) {
    }
}
