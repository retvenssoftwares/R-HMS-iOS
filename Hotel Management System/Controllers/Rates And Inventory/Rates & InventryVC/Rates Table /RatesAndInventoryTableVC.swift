//
//  RatesAndInventoryTableVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 07/11/23.
//

import UIKit

class RatesAndInventoryTableVC: UIViewController {

    @IBOutlet weak var RatesAndInventoryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        RatesAndInventoryTableView.register(UINib(nibName: "RatesAndInventoryTableCell", bundle: nil), forCellReuseIdentifier: "RatesAndInventoryTableCell")
        RatesAndInventoryTableView.register(UINib(nibName: "RateHeaderCell", bundle: nil), forCellReuseIdentifier: "RateHeaderCell")
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



extension RatesAndInventoryTableVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RateHeaderCell", for: indexPath) as! RateHeaderCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatesAndInventoryTableCell", for: indexPath) as! RatesAndInventoryTableCell
        return cell
    }
   
    
}
