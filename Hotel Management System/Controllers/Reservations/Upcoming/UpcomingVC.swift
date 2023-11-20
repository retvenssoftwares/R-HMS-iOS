//
//  UpcomingVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 06/11/23.
//

import UIKit

class UpcomingVC: UIViewController {

    
    
    // MARK: - Outlet
    @IBOutlet weak var upcomingTableCell: UITableView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        upcomingTableCell.register(UINib(nibName: "ReservationsTableCell", bundle: nil), forCellReuseIdentifier: "ReservationsTableCell")
    }
    

}


// MARK: - Extension TableView
extension UpcomingVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationsTableCell", for: indexPath) as! ReservationsTableCell
        cell.setDataUpcoming(no: indexPath.row)
        return cell
    }
    
}
