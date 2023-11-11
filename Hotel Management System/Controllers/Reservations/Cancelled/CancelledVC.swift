//
//  CancelledVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 06/11/23.
//

import UIKit

class CancelledVC: UIViewController {

    
    // MARK: - Outlet

    @IBOutlet weak var cancelledTableCell: UITableView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelledTableCell.register(UINib(nibName: "ReservationsTableCell", bundle: nil), forCellReuseIdentifier: "ReservationsTableCell")
    }
    

  

}

// MARK: - Extension Tableview

extension CancelledVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationsTableCell", for: indexPath) as! ReservationsTableCell
        cell.setDataCancelled(no: indexPath.row)
        return cell
    }
}
