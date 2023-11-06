//
//  AddAmenityVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 04/11/23.
//

import UIKit

class AddAmenityVC: UIViewController {
    
    
    // MARK: - Outlet
    @IBOutlet weak var addAmenityTableCell: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addAmenityTableCell.register(UINib(nibName: "AddAmenityCell", bundle: nil), forCellReuseIdentifier: "AddAmenityCell")
        addAmenityTableCell.register(UINib(nibName: "FooterCell", bundle: nil), forCellReuseIdentifier: "FooterCell")
    }
}


// MARK: - Extension TableView
extension AddAmenityVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 9{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FooterCell", for: indexPath) as! FooterCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddAmenityCell", for: indexPath) as! AddAmenityCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateAmenityVC") as! CreateAmenityVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
