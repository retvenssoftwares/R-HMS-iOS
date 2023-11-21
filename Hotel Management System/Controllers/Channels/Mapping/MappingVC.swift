//
//  MappingVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 09/11/23.
//

import UIKit

class MappingVC: UIViewController {
    
    
    // MARK: - Outlet
    @IBOutlet weak var mappingTableView: UITableView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        mappingTableView.register(UINib(nibName: "MapingTableCell", bundle: nil), forCellReuseIdentifier: "MapingTableCell")
    }

}
// MARK: - Extension TableView
extension MappingVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapingTableCell", for: indexPath) as! MapingTableCell
        cell.setData(no: indexPath.row)
        return cell
    }
}
