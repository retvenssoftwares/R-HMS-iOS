//
//  BedDetailsVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 04/11/23.
//

import Foundation
import UIKit

class BedDetailsVC: UIViewController {
    
    @IBOutlet weak var bedDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bedDetailTableView.register(UINib(nibName: "BedTableViewCell", bundle: nil), forCellReuseIdentifier: "BedTableViewCell")
    }
}

extension BedDetailsVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BedTableViewCell", for: indexPath) as! BedTableViewCell

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddAmenityVC") as! AddAmenityVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

