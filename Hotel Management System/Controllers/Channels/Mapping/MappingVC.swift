//
//  MappingVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 09/11/23.
//

import UIKit

class MappingVC: UIViewController {
    
    @IBOutlet weak var mappingTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mappingTableView.register(UINib(nibName: "MapingTableCell", bundle: nil), forCellReuseIdentifier: "MapingTableCell")
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



extension MappingVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapingTableCell", for: indexPath) as! MapingTableCell
        cell.setData(no: indexPath.row)
        return cell
    }
   
    
}
