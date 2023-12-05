//
//  AdultsPops.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 22/11/23.
//

import UIKit
import IQKeyboardManagerSwift

class AdultsPops: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var lblAdults: UILabel!
    @IBOutlet weak var lblAdultsDescription: UILabel!
    @IBOutlet weak var lblBase: UILabel!
    @IBOutlet weak var lblMax: UILabel!
    @IBOutlet weak var pickerViewBase: UIPickerView!
    @IBOutlet weak var pickerViewMax: UIPickerView!
    
    var onPickerSelection: ((String) -> Void)?
    var selectedValue:String = ""
    var labelAdults: String?
    var labelAdultsDescription:String?
    let arrNumbersBase = ["1", "2", "3", "4", "5"]
    let arrNumbersMax = ["1", "2", "3", "4", "5"]
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 300
       
        lblAdults.text = labelAdults
        lblAdultsDescription.text = labelAdultsDescription
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
               let selectedValue = arrNumbersBase[row]
                      onPickerSelection?(selectedValue)
                      dismiss(animated: true, completion: nil)
//               let selectedItem = arrNumbersBase[row]
//               print("Selected Item: \(selectedItem)")
           }
           let selectedValue = arrNumbersMax[row]
                  onPickerSelection?(selectedValue)
                  dismiss(animated: true, completion: nil)
//           let selectedItem = arrNumbersMax[row]
//           print("Selected Item: \(selectedItem)")
         
       }
    
    
}
