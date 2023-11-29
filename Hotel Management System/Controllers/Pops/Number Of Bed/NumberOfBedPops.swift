//
//  NumberOfBedPops.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 22/11/23.
//

import UIKit


class NumberOfBedPops: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var lblNumberOfBed: UILabel!
    @IBOutlet weak var lblDescriptionBed: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let arrNumbers = ["1", "2", "3", "4", "5"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
       
    }


}

// MARK: - Extension PickerView
extension NumberOfBedPops:UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrNumbers.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return arrNumbers[row]
       }
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           let selectedItem = arrNumbers[row]
         
       }
    
    
}
