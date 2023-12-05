//
//  BedTypePops.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 03/12/23.
//

import UIKit

class BedTypePops: UIViewController {

    @IBOutlet weak var lblFirstBedType: UILabel!
    @IBOutlet weak var bedTypePickerView: UIPickerView!
    @IBOutlet weak var lblBedDes: UILabel!
    
    let arrNumbers = ["King Sized Bed", "Queen Sized Bed", "Double Bed", "Twin Bed", "Under The Table"]
    var onPickerSelection: ((String) -> Void)?
    var selectedValue:String = ""
    var labelBedType: String?
    var labelDescriptionBed: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        lblFirstBedType.text = labelBedType
        lblBedDes.text = labelDescriptionBed
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension BedTypePops:UIPickerViewDelegate, UIPickerViewDataSource{
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
