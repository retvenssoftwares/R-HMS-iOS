//
//  AddAmenityVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 03/11/23.
//

import UIKit

class AddAmenityVC: UIViewController {
    
    
    // MARK: - Outlet
    @IBOutlet weak var txtFieldSearch: UITextField!
    @IBOutlet weak var addAmenityTableCell: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addAmenityTableCell.register(UINib(nibName: "AddAmenityCell", bundle: nil), forCellReuseIdentifier: "AddAmenityCell")
       
        txtFieldSearch.attributedPlaceholder = NSAttributedString(string: txtFieldSearch.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
    }
    

   

}


// MARK: - Extension TableView
extension AddAmenityVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddAmenityCell", for: indexPath) as! AddAmenityCell
        return cell
    }
    
    
}
