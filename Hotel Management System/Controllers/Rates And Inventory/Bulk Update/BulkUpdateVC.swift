//
//  BulkUpdateVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 07/11/23.
//

import UIKit
import iOSDropDown

class BulkUpdateVC: UIViewController {

    @IBOutlet weak var txtFieldRatePlane: DropDown!
    @IBOutlet weak var txtFielRoomType: DropDown!
    @IBOutlet weak var txtFIeldSource: DropDown!
    @IBOutlet weak var viewDate: UIView!
    @IBOutlet weak var viewRatePlane: UIView!
    @IBOutlet weak var viewRoomType: UIView!
    @IBOutlet weak var ViewSource: UIView!
    @IBOutlet weak var bulkUpdatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        bulkUpdatTableView.register(UINib(nibName: "BulkUpdateTableCell", bundle: nil), forCellReuseIdentifier: "BulkUpdateTableCell")
            
        txtFIeldSource.optionArray = ["ABC", "BCD", "EFG"]
        txtFielRoomType.optionArray = ["ABC", "BCD", "EFG"]
        txtFieldRatePlane.optionArray = ["ABC", "BCD", "EFG"]
        
        let color = UIColor.init(named: "TextColor")
        txtFIeldSource.attributedPlaceholder = NSAttributedString(string: txtFIeldSource.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFielRoomType.attributedPlaceholder = NSAttributedString(string: txtFielRoomType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldRatePlane.attributedPlaceholder = NSAttributedString(string: txtFieldRatePlane.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
    }
}


extension BulkUpdateVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "BulkUpdateTableCell", for: indexPath) as! BulkUpdateTableCell
        return cell
    }
   
    
}
