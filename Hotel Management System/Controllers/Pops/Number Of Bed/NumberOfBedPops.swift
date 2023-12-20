//
//  NumberOfBedPops.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 22/11/23.
//

import UIKit
import IQKeyboardManagerSwift


class NumberOfBedPops: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var lblNumberOfBed: UILabel!
    @IBOutlet weak var lblDescriptionBed: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let arrNumbers = ["1", "2", "3", "4", "5"]
    var onPickerSelection: ((String) -> Void)?
    var selectedValue:String = ""

    let userDeafults = UserDefaults.standard
    var labelNumberOfBed: String?
    var labelDescriptionBed: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //IQKeyboardManager.shared.disabledToolbarClasses.append(NumberOfBedPops.self)
        pickerView.delegate = self
        pickerView.dataSource = self
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 300
        lblNumberOfBed.text = labelNumberOfBed
        lblDescriptionBed.text = labelDescriptionBed
        
       
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
        let selectedValue = arrNumbers[row]
               onPickerSelection?(selectedValue)
               dismiss(animated: true, completion: nil)

      }
}
