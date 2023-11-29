//
//  AdultsPops.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 22/11/23.
//

import UIKit

class AdultsPops: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var lblAdults: UILabel!
    @IBOutlet weak var lblAdultsDescription: UILabel!
    @IBOutlet weak var lblBase: UILabel!
    @IBOutlet weak var lblMax: UILabel!
    @IBOutlet weak var pickerViewBase: UIPickerView!
    @IBOutlet weak var pickerViewMax: UIPickerView!
    
    
    let arrNumbersBase = ["1", "2", "3", "4", "5"]
    let arrNumbersMax = ["1", "2", "3", "4", "5"]
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }


   
}

extension AdultsPops:UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 1{
            return 1
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return arrNumbersBase.count
        }
        return arrNumbersMax.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return arrNumbersBase[row]
        }
        return arrNumbersMax[row]
       }
  

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            // Set a height that fits all items without scrolling
            return 40.0
        }
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           if pickerView.tag == 1{
               let selectedItem = arrNumbersBase[row]
               print("Selected Item: \(selectedItem)")
           }
           let selectedItem = arrNumbersMax[row]
           print("Selected Item: \(selectedItem)")
         
       }
    
    
}
