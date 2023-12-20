//
//  SelectMealVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 25/11/23.
//

import UIKit

class SelectMealVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var selectMealTableVIew: UITableView!
    
    var filterdata:[String]!
    
    
    
    var arrMealPlane = ["EP", "CP", "ZP", "TYU", "KL"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterdata = arrMealPlane
        selectMealTableVIew.register(UINib(nibName: "SelectMealTableCell", bundle: nil), forCellReuseIdentifier: "SelectMealTableCell")
        
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear
        searchBar.isTranslucent = true
        self.searchBar.searchTextField.backgroundColor = UIColor.systemGray6
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnfilterPressed(_ sender: UIButton) {
    }
    @IBAction func nextBtnPressed(_ sender: Any) {
    }
}




extension SelectMealVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectMealTableCell", for: indexPath) as! SelectMealTableCell
        cell.lblName.text = arrMealPlane[indexPath.row]
        if filterdata.count != 0
               {
                   cell.lblName.text = filterdata[indexPath.row]
               }
               else{
                   cell.lblName.text = arrMealPlane[indexPath.row]
               }
        return cell
    }
}


extension SelectMealVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
               filterdata = searchText.isEmpty ? arrMealPlane : arrMealPlane.filter { $0.contains(searchText) }
        selectMealTableVIew.reloadData()
        
       }
}

