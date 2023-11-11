//
//  ReservationVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 06/11/23.
//

import UIKit
import iOSDropDown

class ReservationVC: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlet

    @IBOutlet weak var lblChild: UILabel!
    @IBOutlet weak var lblAdults: UILabel!
    @IBOutlet weak var txtFieldInternalNote: UITextField!
    @IBOutlet weak var txtFIeldSpecialRequest: UITextField!
    @IBOutlet weak var txtFIeldEmail: UITextField!
    @IBOutlet weak var txtFieldGuest: UITextField!
    @IBOutlet weak var txtFieldSalution: UITextField!
    @IBOutlet weak var txtFieldPhone: UITextField!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var txtFieldCompany: DropDown!
    @IBOutlet weak var txtFieldRoomType: DropDown!
    @IBOutlet weak var txtFieldBookingType: UITextField!
    @IBOutlet weak var txtFIeldCHeakOut: UITextField!
    @IBOutlet weak var txtField3Night: UITextField!
    @IBOutlet weak var txtFIeldCheakIn: UITextField!
    @IBOutlet weak var viewInternalNote: UIView!
    @IBOutlet weak var viewSpecialRequest: UIView!
    @IBOutlet weak var viewRemarks: UIView!
    @IBOutlet weak var viewEMail: UIView!
    @IBOutlet weak var viewGuestName: UIView!
    @IBOutlet weak var viewSalutation: UIView!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewGuestInfo: UIView!
    @IBOutlet weak var viewChilds: UIView!
    @IBOutlet weak var viewAdults: UIView!
    @IBOutlet weak var viewRatePlane: UIView!
    @IBOutlet weak var viewRoomType: UIView!
    @IBOutlet weak var btnRommdetailsSave: UIButton!
    @IBOutlet weak var viewRoomDetails: UIView!
    @IBOutlet weak var viewCheakIn: UIView!
    @IBOutlet weak var btnNavigationSave: UIButton!
    @IBOutlet weak var viewBookingType: UIView!
    @IBOutlet weak var viewCheakOut: UIView!
    @IBOutlet weak var viewNight: UIView!
    @IBOutlet weak var viewCheakInDate: UIView!
    @IBOutlet weak var viewReservationDetails: UIView!
    
   
    
    var adultValue:Int = 0{
        didSet{
            lblAdults.text = "\(adultValue)"
        }
    }
    
    var childValue:Int = 0{
        didSet{
            lblChild.text = "\(adultValue)"
        }
    }
    
    let datePicker = UIDatePicker()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtFIeldCheakIn.delegate = self
        
        
        
        btnNavigationSave.layer.cornerRadius = 5
        btnRommdetailsSave.layer.cornerRadius = 5
        
        textFieldBorderLine()
        txtFieldPlaceholderTextChange()
        dropDowmMenuOptions()
        
           
    }
    
//    func showDateTimePicker() {
//          let datePicker = UIDatePicker()
//          datePicker.datePickerMode = .dateAndTime
//          datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
//
//          // Create an alert controller to contain the date picker
//          let alert = UIAlertController(title: "Select Date and Time", message: "\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
//
//          alert.view.addSubview(datePicker)
//
//          let doneAction = UIAlertAction(title: "Done", style: .default) { _ in
//              let formatter = DateFormatter()
//              formatter.dateStyle = .medium
//              formatter.timeStyle = .short
//              self.txtFIeldCheakIn.text = formatter.string(from: datePicker.date)
//             
//          }
//
//          alert.addAction(doneAction)
//          present(alert, animated: true, completion: nil)
//      }
//    
//    
//    @objc func dateChanged(datePicker: UIDatePicker) {
//            let formatter = DateFormatter()
//            formatter.dateStyle = .short
//            formatter.timeStyle = .short
//        txtFIeldCheakIn.text = formatter.string(from: datePicker.date)
//        }
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        if textField == txtFIeldCheakIn  {
//               showDateTimePicker()
//               return false
//           }
//           return true
//       }
//    
    
    
    func showDateTimePicker() {
          let datePicker = UIDatePicker()
          datePicker.datePickerMode = .dateAndTime
          datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)

          // Create an alert controller to contain the date picker
          let alert = UIAlertController(title: "Select Date and Time", message: "\n\n\n\n\n\n\n", preferredStyle: .actionSheet)

          alert.view.addSubview(datePicker)

          let doneAction = UIAlertAction(title: "Done", style: .default) { _ in
              let formatter = DateFormatter()
              formatter.dateStyle = .medium
              formatter.timeStyle = .short
              self.txtFIeldCheakIn.text = formatter.string(from: datePicker.date)
             
          }

          alert.addAction(doneAction)
          present(alert, animated: true, completion: nil)
      }
    
    
    @objc func dateChanged(datePicker: UIDatePicker) {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short
        txtFIeldCheakIn.text = formatter.string(from: datePicker.date)
        }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == txtFIeldCheakIn  {
               showDateTimePicker()
               return false
           }
           return true
       }
    
    
    
    func dropDowmMenuOptions(){
        txtFieldCompany.optionArray = ["ABC", "BCD", "EFG"]
        txtFieldRoomType.optionArray = ["ABC", "BCD", "EFG"]
    }
    
    
    
    func txtFieldPlaceholderTextChange(){
        let color = UIColor.init(named: "TextColor")
        txtFIeldCheakIn.attributedPlaceholder = NSAttributedString(string: txtFIeldCheakIn.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtField3Night.attributedPlaceholder = NSAttributedString(string: txtField3Night.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFIeldCHeakOut.attributedPlaceholder = NSAttributedString(string: txtFIeldCHeakOut.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldBookingType.attributedPlaceholder = NSAttributedString(string: txtFieldBookingType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldRoomType.attributedPlaceholder = NSAttributedString(string: txtFieldRoomType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldPhone.attributedPlaceholder = NSAttributedString(string: txtFieldPhone.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldSalution.attributedPlaceholder = NSAttributedString(string: txtFieldSalution.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldGuest.attributedPlaceholder = NSAttributedString(string: txtFieldGuest.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFIeldEmail.attributedPlaceholder = NSAttributedString(string: txtFIeldEmail.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFIeldSpecialRequest.attributedPlaceholder = NSAttributedString(string: txtFIeldSpecialRequest.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldInternalNote.attributedPlaceholder = NSAttributedString(string: txtFieldInternalNote.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    
    func textFieldBorderLine(){
        viewCheakOut.layer.cornerRadius = 10
        viewCheakOut.layer.borderWidth = 1
        viewCheakOut.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewBookingType.layer.cornerRadius = 10
        viewBookingType.layer.borderWidth = 1
        viewBookingType.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewReservationDetails.layer.cornerRadius = 15
        viewReservationDetails.layer.borderWidth = 1
        viewReservationDetails.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewCheakInDate.layer.cornerRadius = 10
        viewCheakInDate.layer.borderWidth = 1
        viewCheakInDate.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewNight.layer.cornerRadius = 10
        viewNight.layer.borderWidth = 1
        viewNight.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        
        
        
        viewCheakIn.layer.cornerRadius = 15
        viewCheakIn.layer.borderWidth = 1
        viewCheakIn.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewRoomDetails.layer.cornerRadius = 15
        viewRoomDetails.layer.borderWidth = 1
        viewRoomDetails.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewRoomType.layer.cornerRadius = 15
        viewRoomType.layer.borderWidth = 1
        viewRoomType.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewRatePlane.layer.cornerRadius = 15
        viewRatePlane.layer.borderWidth = 1
        viewRatePlane.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewAdults.layer.cornerRadius = 15
        viewAdults.layer.borderWidth = 1
        viewAdults.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewChilds.layer.cornerRadius = 15
        viewChilds.layer.borderWidth = 1
        viewChilds.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewGuestInfo.layer.cornerRadius = 15
        viewGuestInfo.layer.borderWidth = 1
        viewGuestInfo.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewPhone.layer.cornerRadius = 15
        viewPhone.layer.borderWidth = 1
        viewPhone.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewSalutation.layer.cornerRadius = 15
        viewSalutation.layer.borderWidth = 1
        viewSalutation.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewGuestName.layer.cornerRadius = 15
        viewGuestName.layer.borderWidth = 1
        viewGuestName.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewEMail.layer.cornerRadius = 15
        viewEMail.layer.borderWidth = 1
        viewEMail.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewRemarks.layer.cornerRadius = 15
        viewRemarks.layer.borderWidth = 1
        viewRemarks.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewSpecialRequest.layer.cornerRadius = 15
        viewSpecialRequest.layer.borderWidth = 1
        viewSpecialRequest.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewInternalNote.layer.cornerRadius = 15
        viewInternalNote.layer.borderWidth = 1
        viewInternalNote.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor

        
    }
    
    
    // MARK: - Function
    @IBAction func adultsAddBtnPressed(_ sender: UIButton) {
        adultValue += 1
    }
    
    @IBAction func adultsRemoveBtnPressed(_ sender: UIButton) {
        adultValue -= 1
    }
    @IBAction func childAddBtnPressed(_ sender: UIButton) {
        childValue += 1
    }
    @IBAction func childRemoveBtnPressed(_ sender: UIButton) {
        childValue -= 1
    }
    
   
    @IBAction func navigationBackBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func deleteTextBtnPressed(_ sender: UIButton) {
        self.lblRate?.text = nil
    }
    @IBAction func coypTextBtnPressed(_ sender: UIButton) {
        UIPasteboard.general.string = lblRate.text
        print("Copied Successfully")
    }
    
   
    
 
}
