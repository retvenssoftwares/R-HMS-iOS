//
//  InventoryVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 07/11/23.
//

import UIKit

class InventoryVC: UIViewController {

    @IBOutlet weak var inventoryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        inventoryTableView.register(UINib(nibName: "InventoryHeaderCell", bundle: nil), forCellReuseIdentifier: "InventoryHeaderCell")
        inventoryTableView.register(UINib(nibName: "InventoryTableCell", bundle: nil), forCellReuseIdentifier: "InventoryTableCell")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension InventoryVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryHeaderCell", for: indexPath) as! InventoryHeaderCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryTableCell", for: indexPath) as! InventoryTableCell
        return cell
    }
   
    
}
