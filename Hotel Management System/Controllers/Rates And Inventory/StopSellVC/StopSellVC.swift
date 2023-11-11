//
//  StopSellVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 07/11/23.
//

import UIKit

class StopSellVC: UIViewController {

    @IBOutlet weak var stopSellTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stopSellTableView.register(UINib(nibName: "StopCellTableCell", bundle: nil), forCellReuseIdentifier: "StopCellTableCell")
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


extension StopSellVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "StopCellTableCell", for: indexPath) as! StopCellTableCell
        return cell
    }
   
    
}
