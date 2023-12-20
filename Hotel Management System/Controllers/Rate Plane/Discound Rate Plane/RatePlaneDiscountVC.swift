//
//  RatePlaneDiscountVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 24/11/23.
//

import UIKit

class RatePlaneDiscountVC: UIViewController {

    @IBOutlet weak var DiscountTableView: UITableView!

    var selectedIndexPath: IndexPath?
    var arrDeluxeCP = ["Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
        DiscountTableView.register(UINib(nibName: "ChargesAndPlanesTableCell", bundle: nil), forCellReuseIdentifier: "ChargesAndPlanesTableCell")
    }
    
  
    
   
    
  
    
   

    
    func deleteItem(at indexPath: IndexPath) {
        arrDeluxeCP.remove(at: indexPath.row)
        DiscountTableView.deleteRows(at: [indexPath], with: .fade)
        DispatchQueue.main.async {
            self.DiscountTableView.reloadData()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addbtnPressed(_ sender: UIButton) {
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
    }
    
}
extension RatePlaneDiscountVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return arrDeluxeCP.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChargesAndPlanesTableCell", for: indexPath) as! ChargesAndPlanesTableCell
        cell.txtFieldDeluxeCP.text = arrDeluxeCP[indexPath.row]
        cell.deleteBtnClicked = {[weak self] in
            self?.deleteItem(at: indexPath)
        }
        return cell
    }
    @objc func addCell(_ sender: UIButton) {
        
    }
    
    
    
}



