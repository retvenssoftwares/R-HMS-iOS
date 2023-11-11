//
//  PromotionViewController.swift
//  Hotel Management System
//
//  Created by mayur bobade on 06/11/23.
//

import UIKit

class ChannelManagerViewController: UIViewController {

    @IBOutlet weak var channelManagerTableView: UITableView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var footerStackBar: UIStackView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        channelManagerTableView.register(UINib(nibName: "ChannelManagementCell", bundle: nil), forCellReuseIdentifier: "ChannelManagementCell")
    }
    

    @IBAction func bTnOne(_ sender: Any) {
    }
    
     @IBAction func btnTwo(_ sender: Any) {
     }
    
    @IBAction func btnThree(_ sender: Any) {
    }
    
     @IBAction func btnFour(_ sender: Any) {
     }
    
    @IBAction func btnFive(_ sender: Any) {
    }
    

}
extension ChannelManagerViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView .dequeueReusableCell(withIdentifier: "ChannelManagementCell", for: indexPath) as! ChannelManagementCell
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ReservationVCDetail") as! ReservationVCDetail
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
