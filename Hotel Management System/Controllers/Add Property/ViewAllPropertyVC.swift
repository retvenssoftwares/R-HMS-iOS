//
//  ViewAllPropertyVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 03/11/23.
//

import UIKit

class ViewAllPropertyVC: UIViewController {
    
    
    // MARK: - Outlet
    
    @IBOutlet weak var viewAllProperties: UITableView!
    
    // MARK: - Lufecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewAllProperties.register(UINib(nibName: "ViewAllPropertyCell", bundle: nil), forCellReuseIdentifier: "ViewAllPropertyCell")
        viewAllProperties.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
    }
}
// MARK: - Extension TableView
extension ViewAllPropertyVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
           
            return cell
        }
        else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            cell.lblHeading.text = "Hotels"
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewAllPropertyCell", for: indexPath) as! ViewAllPropertyCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddAmenityVC") as! AddAmenityVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
