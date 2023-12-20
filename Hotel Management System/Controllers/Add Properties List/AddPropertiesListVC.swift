//
//  AddPropertiesListVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 03/11/23.
//

import UIKit

class AddPropertiesListVC: UIViewController {
    
    
    // MARK: - Outlet

    @IBOutlet weak var addPropertiesListTableCell: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addPropertiesListTableCell.register(UINib(nibName: "AllPropertiesListCell", bundle: nil), forCellReuseIdentifier: "AllPropertiesListCell")
        addPropertiesListTableCell.register(UINib(nibName: "FooterCell", bundle: nil), forCellReuseIdentifier: "FooterCell")
    }
    

 

}

// MARK: - Extension tableView

extension AddPropertiesListVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 9{
            let cell = tableView .dequeueReusableCell(withIdentifier: "FooterCell", for: indexPath) as! FooterCell
            return cell
        }
        let cell = tableView .dequeueReusableCell(withIdentifier: "AllPropertiesListCell", for: indexPath) as! AllPropertiesListCell
        return cell
    }
    
    
}
