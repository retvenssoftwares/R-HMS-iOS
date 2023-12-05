//
//  ResticationsVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 07/11/23.
//

import UIKit

class ResticationsVC: UIViewController {

    @IBOutlet weak var resticationsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        resticationsTableView.register(UINib(nibName: "ResticationsHeaderCell", bundle: nil), forCellReuseIdentifier: "ResticationsHeaderCell")
        resticationsTableView.register(UINib(nibName: "ResticationsTableCell", bundle: nil), forCellReuseIdentifier: "ResticationsTableCell")

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



extension ResticationsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResticationsHeaderCell", for: indexPath) as! ResticationsHeaderCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResticationsTableCell", for: indexPath) as! ResticationsTableCell
        return cell
    }
   
    
}
