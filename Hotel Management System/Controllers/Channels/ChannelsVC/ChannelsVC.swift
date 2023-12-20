//
//  ChannelsVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 08/11/23.
//

import UIKit

class ChannelsVC: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var channelsTableView: UITableView!
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        channelsTableView.register(UINib(nibName: "ChannelsTableCell", bundle: nil), forCellReuseIdentifier: "ChannelsTableCell")
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    // MARK: - Action
    @IBAction func floatingAddBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddChannelsVC") as! AddChannelsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - Extension Tableview
   extension ChannelsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelsTableCell", for: indexPath) as! ChannelsTableCell
        return cell
    }
   
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let vc = self.storyboard?.instantiateViewController(withIdentifier: "OTASVC") as! OTASVC
           self.navigationController?.pushViewController(vc, animated: true)
       }
}
