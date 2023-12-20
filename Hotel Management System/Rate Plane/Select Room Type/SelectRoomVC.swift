//
//  SelectRoomVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 25/11/23.
//

import UIKit

class SelectRoomVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var selectRoomTableView: UITableView!
    
    var filterdata:[String]!
    
    var arrSelectRoom = ["Super Deluxe Room", "Super Deluxe Room", "Super Deluxe Room", "Super Deluxe Room", "Super Deluxe Room","Super Deluxe Room", "Super Deluxe Room", "Super Deluxe Room", "Super Deluxe Room", "Super Deluxe Room"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterdata = arrSelectRoom
        selectRoomTableView.register(UINib(nibName: "SelectMealTableCell", bundle: nil), forCellReuseIdentifier: "SelectMealTableCell")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnFilterPressed(_ sender: UIButton) {
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextBtnPressed(_ sender: UIButton) {
    }
    
}


extension SelectRoomVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectMealTableCell", for: indexPath) as! SelectMealTableCell
        cell.lblName.text = arrSelectRoom[indexPath.row]
        if filterdata.count != 0
               {
                   cell.lblName.text = filterdata[indexPath.row]
               }
               else{
                   cell.lblName.text = arrSelectRoom[indexPath.row]
               }
        return cell
    }
}


extension SelectRoomVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
               filterdata = searchText.isEmpty ? arrSelectRoom : arrSelectRoom.filter { $0.contains(searchText) }
        selectRoomTableView.reloadData()
       }

}
