//
//  SelectCompanyVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 25/11/23.
//

import UIKit

class SelectCompanyVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var selectCompanyTableView: UITableView!
    
    var filterdata:[String]!

    
    var arrSelectComapny = ["Apple inc.", "Bowing inc.", "DELTA Corp", "Evil Corp", "Flipkart", "German Motors", "Honda Moto Corp"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filterdata = arrSelectComapny
        selectCompanyTableView.register(UINib(nibName: "SelectMealTableCell", bundle: nil), forCellReuseIdentifier: "SelectMealTableCell")
    }
    

   
    @IBAction func filterBtnPressed(_ sender: UIButton) {
    }
    @IBAction func backBttnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextBtnPressed(_ sender: Any) {
        
    }
    
}


extension SelectCompanyVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectMealTableCell", for: indexPath) as! SelectMealTableCell
        cell.lblName.text = arrSelectComapny[indexPath.row]
        if filterdata.count != 0
               {
                   cell.lblName.text = filterdata[indexPath.row]
               }
               else{
                   cell.lblName.text = arrSelectComapny[indexPath.row]
               }
        return cell
    }
}


extension SelectCompanyVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
               filterdata = searchText.isEmpty ? arrSelectComapny : arrSelectComapny.filter { $0.contains(searchText) }
        selectCompanyTableView.reloadData()
       }
    
}
    
