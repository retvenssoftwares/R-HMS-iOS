//
//  ChannelsVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 08/11/23.
//

import UIKit

class ChannelsVC: UIViewController {

    @IBOutlet weak var channelsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        channelsTableView.register(UINib(nibName: "ChannelsTableCell", bundle: nil), forCellReuseIdentifier: "ChannelsTableCell")
        
    }
    
    
  
    
    @IBAction func floatingAddBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddChannelsVC") as! AddChannelsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
 

}


extension ChannelsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelsTableCell", for: indexPath) as! ChannelsTableCell
        return cell
    }
   
    
}
