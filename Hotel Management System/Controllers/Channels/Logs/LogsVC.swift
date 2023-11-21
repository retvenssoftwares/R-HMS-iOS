//
//  LogoVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 09/11/23.
//

import UIKit

class LogsVC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var logsTableView: UITableView!
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        logsTableView.register(UINib(nibName: "LogsTableCell", bundle: nil), forCellReuseIdentifier: "LogsTableCell")
        logsTableView.register(UINib(nibName: "LogsHeaderTableCell", bundle: nil), forCellReuseIdentifier: "LogsHeaderTableCell")
    }
}

// MARK: - Extension Tableview
extension LogsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogsHeaderTableCell", for: indexPath) as! LogsHeaderTableCell
            return cell
        }
        else    if indexPath.row == 6{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogsHeaderTableCell", for: indexPath) as! LogsHeaderTableCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogsTableCell", for: indexPath) as! LogsTableCell
        return cell
    }
}
