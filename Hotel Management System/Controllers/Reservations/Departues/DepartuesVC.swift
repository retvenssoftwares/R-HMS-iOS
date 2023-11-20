//
//  DepartuesVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 06/11/23.
//

import UIKit

class DepartuesVC: UIViewController {

    
    // MARK: - Outlet
    @IBOutlet weak var departuesTableCell: UITableView!
    
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()

        departuesTableCell.register(UINib(nibName: "ReservationsTableCell", bundle: nil), forCellReuseIdentifier: "ReservationsTableCell")
    }
    


}


   // MARK: - Extension Tableview
extension DepartuesVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationsTableCell", for: indexPath) as! ReservationsTableCell
        cell.setDataArrivalsVC(no: indexPath.row)
        return cell
    }
    
    
}
