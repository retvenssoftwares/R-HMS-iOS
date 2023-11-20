//
//  QuickReservationsVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 07/11/23.
//

import UIKit

class QuickReservationsVC: UIViewController {
    
    
    
    // MARK: - Outlet
    @IBOutlet weak var datePickerCheakOut: UIDatePicker!
    @IBOutlet weak var viewCheakOutDate: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var viewDatePicker: UIView!
    @IBOutlet weak var lblCHeakOutDate: UILabel!
    @IBOutlet weak var lblCheakInDate: UILabel!
    @IBOutlet weak var btnChild5: UIButton!
    @IBOutlet weak var btnChild4: UIButton!
    @IBOutlet weak var btnChild3: UIButton!
    @IBOutlet weak var btnChild2: UIButton!
    @IBOutlet weak var btnChild1: UIButton!
    @IBOutlet weak var btnAdults5: UIButton!
    @IBOutlet weak var btnAdults4: UIButton!
    @IBOutlet weak var btnAdults3: UIButton!
    @IBOutlet weak var btnAdults2: UIButton!
    @IBOutlet weak var btnAdults1: UIButton!
    @IBOutlet weak var viewSetOccupancy: UIView!
    @IBOutlet weak var btnCancelPayments: UIButton!
    @IBOutlet weak var btnSavePayments: UIButton!
    @IBOutlet weak var viewAddPayments: UIView!
    @IBOutlet weak var btnFullBoardPlane: UIButton!
    @IBOutlet weak var btnModifieAmericanPlane: UIButton!
    @IBOutlet weak var btnAmericanPlane: UIButton!
    @IBOutlet weak var btnContinentalPlane: UIButton!
    @IBOutlet weak var btnEuropeanePlane: UIButton!
    @IBOutlet weak var viewSelectRatePlane: UIView!
    @IBOutlet weak var btnFamilyRoom: UIButton!
    @IBOutlet weak var btnSupermeDeluxe: UIButton!
    @IBOutlet weak var btnVIPRoom: UIButton!
    @IBOutlet weak var btnSuperDeluxe: UIButton!
    @IBOutlet weak var btnDeluxeRoom: UIButton!
    @IBOutlet weak var viewSelectRoomType: UIView!
    @IBOutlet weak var viewHoldRooms: UIView!
    @IBOutlet weak var viewEnquiryonly: UIView!
    @IBOutlet weak var viewConfirmbooking: UIView!
    @IBOutlet weak var btnHoldRooms: UIButton!
    @IBOutlet weak var btnEnquiryOnly: UIButton!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var vieBgSelectReservationType: UIView!
    @IBOutlet weak var lblEstimatedTottal: UILabel!
    @IBOutlet weak var bookingTypeView: UIView!
    @IBOutlet weak var viewRoomDetails: UIView!
    @IBOutlet weak var viewPhoneNumber: UIView!
    @IBOutlet weak var txtFieldPhoneNumber: UITextField!
    @IBOutlet weak var viewSaluatations: UIView!
    @IBOutlet weak var txtFieldSalutations: UITextField!
    @IBOutlet weak var viewGuestName: UIView!
    @IBOutlet weak var txtFieldGuestName: UITextField!
    @IBOutlet weak var viewEmailAdress: UIView!
    @IBOutlet weak var txtFieldEmailAddress: UITextField!
    @IBOutlet weak var viewRemark: UIView!
    @IBOutlet weak var txtFieldRemark: UITextField!
    @IBOutlet weak var viewInternalNote: UIView!
    @IBOutlet weak var txtFieldInternalNote: UITextField!
    @IBOutlet weak var btnAddPayments: UIButton!
    @IBOutlet weak var lblBookingTypeConfirmed: UILabel!
    @IBOutlet weak var lblRoomType: UILabel!
    @IBOutlet weak var lblRatePlane: UILabel!
    @IBOutlet weak var btnAdultsOne: UIButton!
    @IBOutlet weak var btnAdultsTwo: UIButton!
    @IBOutlet weak var btnAdultsThree: UIButton!
    @IBOutlet weak var btnAdultsFour: UIButton!
    @IBOutlet weak var btnAdultsFive: UIButton!
    @IBOutlet weak var btnChildOne: UIButton!
    @IBOutlet weak var btnChildTwo: UIButton!
    @IBOutlet weak var btnChildThree: UIButton!
    @IBOutlet weak var btnChildFour: UIButton!
    @IBOutlet weak var btnChildFive: UIButton!
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.locale = .current
        datePicker.date = Date()
        datePicker.preferredDatePickerStyle = .compact
        
        datePickerCheakOut.locale = .current
        datePickerCheakOut.date = Date()
        datePickerCheakOut.preferredDatePickerStyle = .compact
        
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        datePicker.addTarget(self, action: #selector(pickerTapped), for: .primaryActionTriggered)
        
        datePickerCheakOut.addTarget(self, action: #selector(cheakOutDateSelected), for: .valueChanged)
        datePickerCheakOut.addTarget(self, action: #selector(pickerTappedCheakOutDate), for: .primaryActionTriggered)
        
        txtFieldPlaceHolderTextColor()
        vieBgSelectReservationType.isHidden = true
        viewSelectRoomType.isHidden = true
        viewSelectRatePlane.isHidden = true
        viewAddPayments.isHidden = true
        viewSetOccupancy.isHidden = true
        viewDatePicker.isHidden = true
        viewCheakOutDate.isHidden = true
        
    }
    // MARK: - Function
    
    
    @objc private func dateChanged() {
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func dateSelected(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        datePicker?.preferredDatePickerStyle = .inline
        let date = dateFormatter.string(from: datePicker.date)
        lblCheakInDate.text = date
    }
    
    
    @objc func pickerTapped(){
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.preferredDatePickerStyle = .automatic
        self.viewDatePicker.isHidden = true
    }
    
    @objc
    func cheakOutDateSelected(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
       
        datePickerCheakOut?.preferredDatePickerStyle = .inline
        let date = dateFormatter.string(from: datePickerCheakOut.date)
        lblCHeakOutDate.text = date
    
        
    }
    
    
    @objc func pickerTappedCheakOutDate(){
        self.datePickerCheakOut.preferredDatePickerStyle = .wheels
        self.datePickerCheakOut.preferredDatePickerStyle = .automatic
        self.viewCheakOutDate.isHidden = true
    }
    
    
    
    
   
    
    func txtFieldPlaceHolderTextColor(){
        let color = UIColor.init(named: "TextColor")
        txtFieldPhoneNumber.attributedPlaceholder = NSAttributedString(string: txtFieldPhoneNumber.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldSalutations.attributedPlaceholder = NSAttributedString(string: txtFieldSalutations.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldGuestName.attributedPlaceholder = NSAttributedString(string: txtFieldGuestName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldEmailAddress.attributedPlaceholder = NSAttributedString(string: txtFieldEmailAddress.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldRemark.attributedPlaceholder = NSAttributedString(string: txtFieldRemark.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldInternalNote.attributedPlaceholder = NSAttributedString(string: txtFieldInternalNote.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    
    
    
    
    // MARK: - Action
    
    @IBAction func EstimatedTottalEditBtnPressed(_ sender: UIButton) {
    }
    @IBAction func AddPaymentsBtnPressed(_ sender: UIButton) {
        viewAddPayments.isHidden = false
        viewAddPayments.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    @IBAction func bookingTypeBtnPressed(_ sender: Any) {
        vieBgSelectReservationType.isHidden = false
        vieBgSelectReservationType.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    @IBAction func roomTypeBtnPressed(_ sender: UIButton) {
        viewSelectRoomType.isHidden = false
        viewSelectRoomType.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    @IBAction func btnRatePlanePressed(_ sender: UIButton) {
        viewSelectRatePlane.isHidden = false
        viewSelectRatePlane.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    
    @IBAction func btnConfirmPressed(_ sender: UIButton) {
        lblBookingTypeConfirmed.text = "Conformed"
        vieBgSelectReservationType.isHidden = true
        viewConfirmbooking.backgroundColor = UIColor.init(named: "SementController")
        if  viewConfirmbooking.backgroundColor == UIColor.init(named: "SementController") {
            viewEnquiryonly.backgroundColor = .white
            viewHoldRooms.backgroundColor = .white
        }
  
    }
    @IBAction func btnEnquiryonlyPressed(_ sender: UIButton) {
        lblBookingTypeConfirmed.text = "Enquiry Only"
        vieBgSelectReservationType.isHidden = true
        viewEnquiryonly.backgroundColor = UIColor.init(named: "SementController")
        if  viewEnquiryonly.backgroundColor == UIColor.init(named: "SementController") {
            viewConfirmbooking.backgroundColor = .white
            viewHoldRooms.backgroundColor = .white
        }
    }
    @IBAction func btnHoldRoomsPressed(_ sender: UIButton) {
        lblBookingTypeConfirmed.text = "Hold Room"
        vieBgSelectReservationType.isHidden = true
        viewHoldRooms.backgroundColor = UIColor.init(named: "SementController")
        if  viewHoldRooms.backgroundColor == UIColor.init(named: "SementController") {
            viewEnquiryonly.backgroundColor = .white
            viewConfirmbooking.backgroundColor = .white
        }
    }
    
    
    @IBAction func DeluxeRoomBtnPressed(_ sender: UIButton) {
        lblRoomType.text = "Deluxe Room"
        btnDeluxeRoom.backgroundColor = UIColor.init(named: "SementController")
        viewSelectRoomType.isHidden = true
        if btnDeluxeRoom.backgroundColor == UIColor.init(named: "SementController") {
            btnSuperDeluxe.backgroundColor = UIColor.clear
            btnVIPRoom.backgroundColor = UIColor.clear
            btnSupermeDeluxe.backgroundColor = UIColor.clear
            btnFamilyRoom.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func superDeluxeRoomBtnPressed(_ sender: UIButton) {
        lblRoomType.text = "Super Deluxe Room"
        btnSuperDeluxe.backgroundColor = UIColor.init(named: "SementController")
        viewSelectRoomType.isHidden = true
        
        if btnSuperDeluxe.backgroundColor == UIColor.init(named: "SementController") {
            btnDeluxeRoom.backgroundColor = UIColor.clear
            btnVIPRoom.backgroundColor = UIColor.clear
            btnSupermeDeluxe.backgroundColor = UIColor.clear
            btnFamilyRoom.backgroundColor = UIColor.clear
        }
    }
    @IBAction func VIPRoomBtnPressed(_ sender: UIButton) {
        lblRoomType.text = "VIP Room"
        btnVIPRoom.backgroundColor = UIColor.init(named: "SementController")
        viewSelectRoomType.isHidden = true
        
        if btnVIPRoom.backgroundColor == UIColor.init(named: "SementController") {
            btnSuperDeluxe.backgroundColor = UIColor.clear
            btnDeluxeRoom.backgroundColor = UIColor.clear
            btnSupermeDeluxe.backgroundColor = UIColor.clear
            btnFamilyRoom.backgroundColor = UIColor.clear
        }
    }
    @IBAction func supermeDeluxeBtnPressed(_ sender: UIButton) {
        lblRoomType.text = "Superme Deluxe "
        btnSuperDeluxe.backgroundColor = UIColor.init(named: "SementController")
        viewSelectRoomType.isHidden = true
        
        if btnSuperDeluxe.backgroundColor == UIColor.init(named: "SementController") {
            btnSuperDeluxe.backgroundColor = UIColor.clear
            btnVIPRoom.backgroundColor = UIColor.clear
            btnDeluxeRoom.backgroundColor = UIColor.clear
            btnFamilyRoom.backgroundColor = UIColor.clear
        }
    }
    @IBAction func familyRoomBtnPressed(_ sender: UIButton) {
        lblRoomType.text = "Family Room"
        btnFamilyRoom.backgroundColor = UIColor.init(named: "SementController")
        viewSelectRoomType.isHidden = true
        
        if btnFamilyRoom.backgroundColor == UIColor.init(named: "SementController") {
            btnSuperDeluxe.backgroundColor = UIColor.clear
            btnVIPRoom.backgroundColor = UIColor.clear
            btnSupermeDeluxe.backgroundColor = UIColor.clear
            btnDeluxeRoom.backgroundColor = UIColor.clear
        }
    }
    
    
    @IBAction func europeaneBtnPressed(_ sender: UIButton) {
        lblRatePlane.text = "European Plan"
        viewSelectRatePlane.isHidden = true
        btnEuropeanePlane.backgroundColor = UIColor.init(named: "SementController")
        
        if  btnEuropeanePlane.backgroundColor == UIColor.init(named: "SementController"){
            btnContinentalPlane.backgroundColor = .clear
            btnAmericanPlane.backgroundColor = .clear
            btnModifieAmericanPlane.backgroundColor = .clear
            btnFullBoardPlane.backgroundColor = .clear
        }
        
    }
    
    @IBAction func continentailbtnPressed(_ sender: UIButton) {
        lblRatePlane.text = "Continental Plan"
        viewSelectRatePlane.isHidden = true
        btnContinentalPlane.backgroundColor = UIColor.init(named: "SementController")
        
        if  btnContinentalPlane.backgroundColor == UIColor.init(named: "SementController"){
            btnEuropeanePlane.backgroundColor = .clear
            btnAmericanPlane.backgroundColor = .clear
            btnModifieAmericanPlane.backgroundColor = .clear
            btnFullBoardPlane.backgroundColor = .clear
        }
    }
    
    @IBAction func americanBtnPressed(_ sender: UIButton) {
        lblRatePlane.text = "American Plan"
        viewSelectRatePlane.isHidden = true
        btnAmericanPlane.backgroundColor = UIColor.init(named: "SementController")
        
        if  btnAmericanPlane.backgroundColor == UIColor.init(named: "SementController"){
            btnEuropeanePlane.backgroundColor = .clear
            btnEuropeanePlane.backgroundColor = .clear
            btnModifieAmericanPlane.backgroundColor = .clear
            btnFullBoardPlane.backgroundColor = .clear
        }
    }
    @IBAction func modifiedAmericanBtnPRessed(_ sender: UIButton) {
        lblRatePlane.text = "Modified American Palne."
        viewSelectRatePlane.isHidden = true
        btnModifieAmericanPlane.backgroundColor = UIColor.init(named: "SementController")
        
        if  btnModifieAmericanPlane.backgroundColor == UIColor.init(named: "SementController"){
            btnEuropeanePlane.backgroundColor = .clear
            btnEuropeanePlane.backgroundColor = .clear
            btnEuropeanePlane.backgroundColor = .clear
            btnFullBoardPlane.backgroundColor = .clear
        }
    }
    @IBAction func fullBoardBtnPressed(_ sender: UIButton) {
        lblRatePlane.text = "Full Board Plan"
        viewSelectRatePlane.isHidden = true
        btnFullBoardPlane.backgroundColor = UIColor.init(named: "SementController")
        
        if  btnFullBoardPlane.backgroundColor == UIColor.init(named: "SementController"){
            btnEuropeanePlane.backgroundColor = .clear
            btnEuropeanePlane.backgroundColor = .clear
            btnEuropeanePlane.backgroundColor = .clear
            btnEuropeanePlane.backgroundColor = .clear
        }
    }
    @IBAction func savePaymentsBtnPressed(_ sender: UIButton) {
        viewAddPayments.isHidden = true
    }
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        viewAddPayments.isHidden = true
    }
    
    @IBAction func adults1BtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func adults2BtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func adults3BtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func adults4BtnPressed(_ sender: UIButton) {
    }
    @IBAction func adults5BtnPressed(_ sender: UIButton) {
    }
    @IBAction func childBtn1Pressed(_ sender: UIButton) {
    }
    @IBAction func childBtn2Pressed(_ sender: UIButton) {
    }
    @IBAction func childBtn3Pressed(_ sender: UIButton) {
    }
    @IBAction func childBtn4Pressed(_ sender: UIButton) {
    }
    
    @IBAction func childBtn5Pressed(_ sender: UIButton) {
    }
    @IBAction func cheakInDataBtnPressed(_ sender: UIButton) {
        if sender.isEnabled == true{
            viewDatePicker.isHidden = false
            datePicker.preferredDatePickerStyle = .inline
            viewDatePicker.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        }
    }
    @IBAction func cheakOutDateBtnPreseed(_ sender: UIButton) {
        if sender.isEnabled == true{
            viewCheakOutDate.isHidden = false
            datePickerCheakOut.preferredDatePickerStyle = .inline
            viewCheakOutDate.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        }
    }
}
