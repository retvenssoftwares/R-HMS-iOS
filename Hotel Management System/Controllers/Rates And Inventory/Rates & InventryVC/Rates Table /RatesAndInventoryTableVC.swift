//
//  RatesAndInventoryTableVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 07/11/23.
//

import UIKit

class RatesAndInventoryTableVC: UIViewController {
    
    var datePicker = UIDatePicker()
    @IBOutlet weak var RatesAndInventoryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        RatesAndInventoryTableView.register(UINib(nibName: "RatesAndInventoryTableCell", bundle: nil), forCellReuseIdentifier: "RatesAndInventoryTableCell")
        RatesAndInventoryTableView.register(UINib(nibName: "RateHeaderCell", bundle: nil), forCellReuseIdentifier: "RateHeaderCell")
    }
    
    @objc private func dateChanged() {
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func dateSelected(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
       
        datePicker.preferredDatePickerStyle = .inline
        let date = dateFormatter.string(from: datePicker.date)
        
    }
    
    
    @objc func pickerTapped(){
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.preferredDatePickerStyle = .automatic
    }
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

