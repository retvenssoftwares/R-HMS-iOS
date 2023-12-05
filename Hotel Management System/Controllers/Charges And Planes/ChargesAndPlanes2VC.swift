//
//  ChargesAndPlanes2VC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 14/11/23.
//

import UIKit
import MaterialComponents.MaterialBottomSheet
class ChargesAndPlanes2VC: UIViewController, UITextFieldDelegate {

    // MARK: - Outlet
    
    @IBOutlet weak var btnMinThershold: UIButton!
    @IBOutlet weak var btnBaseRate: UIButton!
    @IBOutlet weak var btnMaxThershold: UIButton!
    @IBOutlet weak var btnExtraAdultRate: UIButton!
    @IBOutlet weak var btnExtraChidledRate: UIButton!
    @IBOutlet weak var txtField5MealSelected: UITextField!
    @IBOutlet weak var txtFieldExtraCHild: UITextField!
    @IBOutlet weak var txtFieldExtraAdultRate: UITextField!
    @IBOutlet weak var txtmaxThershold: UITextField!
    @IBOutlet weak var txtFieldBaseRate: UITextField!
    @IBOutlet weak var txtFieldMinThershold: UITextField!
    @IBOutlet weak var progressBarMaxThreshold: UIProgressView!
    @IBOutlet weak var progressBarMinThrreshold: UIProgressView!
    @IBOutlet weak var progressBarBaseRate: UIProgressView!
    @IBOutlet weak var lblTopMaxThreshold: UILabel!
    @IBOutlet weak var lblTopBaseRate: UILabel!
    @IBOutlet weak var lblTopMinThreshold: UILabel!
    @IBOutlet weak var chargesAndPlane2TableCell: UITableView!
    
    var activeTextField: UITextField?

    
    var rate: String?
    var min: String?
    var max: String?
    var extra: String?
    var base: String?
    
    let maxValue: Float = 100000
    
    var arrDeluxeCP = ["Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP",]
    
    var arrRatePlane = ["Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal",]
    var arrInclusions = ["6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions",]
    var arrRate = ["₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00",]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        lblExtraChildRate.text = rate
//        lblBaseRate.text = base
//        lblMinThreshold.text = min
//        lblMaxThershold.text = max
//        lblExtraAdultRate.text = extra
//        lblTopBaseRate.text = base
//        lblTopMinThreshold.text = min
//        lblTopMaxThreshold.text = max
        
        updateProgressBaseRate(withValue: 30000.00)
        updateProgressMinThreshold(withValue: 50000.00)
        updateProgressMaxThershold(withValue: 10000.00)
        
        chargesAndPlane2TableCell.register(UINib(nibName: "ChargesAndPlanesTableCell", bundle: nil), forCellReuseIdentifier: "ChargesAndPlanesTableCell")
    }
    // MARK: - Function
    
    
    
    func updateProgressMinThreshold(withValue value: Float) {
        let normalizedValue = Swift.min(Swift.max(value / maxValue, 0.0), 1.0)
        progressBarMinThrreshold.progress = normalizedValue
       
    }
    func updateProgressBaseRate(withValue value: Float) {
        let normalizedValue = Swift.min(Swift.max(value / maxValue, 0.0), 1.0)
        progressBarBaseRate.progress = normalizedValue
       
    }
    func updateProgressMaxThershold(withValue value: Float) {
        let normalizedValue = Swift.min(Swift.max(value / maxValue, 0.0), 1.0)
        progressBarMaxThreshold.progress = normalizedValue
       
    }
    func deleteItem(at indexPath: IndexPath) {
          
            arrRate.remove(at: indexPath.row)
            arrInclusions.remove(at: indexPath.row)
            arrDeluxeCP.remove(at: indexPath.row)
            arrRatePlane.remove(at: indexPath.row)
            chargesAndPlane2TableCell.deleteRows(at: [indexPath], with: .fade)
        }
    
    func minThersholdBottamSheet(){
        let bottomSheetVC = PropertyNamePop(nibName: "PropertyNamePop", bundle: nil)
      bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelPropertyName = "Min Threshold"
        bottomSheetVC.labelPropertyDescription = " This is the minimum rate we'll accept for bookings of this specific room type, ensuring fair pricing for your property."
        present(bottomSheetVC, animated: true, completion: nil)
        bottomSheetVC.saveBtnClicked = { [weak self] text in
            self?.activeTextField?.text = text
        }
    }
    func baseRateBottamSheet(){
        let bottomSheetVC = PropertyNamePop(nibName: "PropertyNamePop", bundle: nil)
      bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelPropertyName = "Base Rate"
        bottomSheetVC.labelPropertyDescription = "This is the default rate for bookings of this room type, providing a starting point for pricing."
        present(bottomSheetVC, animated: true, completion: nil)
        bottomSheetVC.saveBtnClicked = { [weak self] text in
            self?.activeTextField?.text = text
        }
    }
    func maxThersholdBottamSheet(){
        let bottomSheetVC = PropertyNamePop(nibName: "PropertyNamePop", bundle: nil)
      bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelPropertyName = "Max Threshold"
        bottomSheetVC.labelPropertyDescription = "This is the maximum rate we'll accept for bookings of this specific room type, maintaining fairness and profitability."
        present(bottomSheetVC, animated: true, completion: nil)
        bottomSheetVC.saveBtnClicked = { [weak self] text in
            self?.activeTextField?.text = text
        }
    }
    func extraChildRateBottamSheet(){
        let bottomSheetVC = PropertyNamePop(nibName: "PropertyNamePop", bundle: nil)
      bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelPropertyName = "Extra Child Rate"
        bottomSheetVC.labelPropertyDescription = "This is the additional charge for each extra child beyond the room's base occupancy."
        present(bottomSheetVC, animated: true, completion: nil)
        bottomSheetVC.saveBtnClicked = { [weak self] text in
            self?.activeTextField?.text = text
        }
    }
    
    func extraAdultRateBottamSheet(){
        let bottomSheetVC = PropertyNamePop(nibName: "PropertyNamePop", bundle: nil)
      bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelPropertyName = "Extra Adult Rate"
        bottomSheetVC.labelPropertyDescription = "This is the extra charge for each adult beyond the room's base occupancy."
        present(bottomSheetVC, animated: true, completion: nil)
        bottomSheetVC.saveBtnClicked = { [weak self] text in
            self?.activeTextField?.text = text
        }
    }
    func selectMealPlaneBottamSheet(){
        UserDefaults.standard.set(txtFieldBaseRate.text, forKey: "baseRate")
        UserDefaults.standard.set(txtFieldMinThershold.text, forKey: "min")
        UserDefaults.standard.set(txtmaxThershold.text, forKey: "max")
     
        let bottomSheetVC = SelectMealPlanePops(nibName: "SelectMealPlanePops", bundle: nil)
      bottomSheetVC.modalPresentationStyle = .overCurrentContext
        present(bottomSheetVC, animated: true, completion: nil)
    }
    @IBAction func btnnavgationNextPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditRatePlanes") as! EditRatePlanes
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnNavigationBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func txtField5MealSeletctedOpen(_ sender: UITextField) {
//        selectMealPlaneBottamSheet()
//    }
//    @IBAction func txtFeildExtraChildOpen(_ sender: UITextField) {
//        activeTextField = txtFieldExtraCHild
//        extraChildRateBottamSheet()
//    }
//    
//    @IBAction func txtFeildExtraAdultRateOpen(_ sender: UITextField) {
//        activeTextField = txtFieldExtraAdultRate
//        extraAdultRateBottamSheet()
//    }
//    @IBAction func txtFieldMaxThersholdOpne(_ sender: UITextField) {
//        activeTextField = txtmaxThershold
//        maxThersholdBottamSheet()
//    }
//    @IBAction func txtFieldBaseRateOpen(_ sender: UITextField) {
//        activeTextField = txtFieldBaseRate
//        baseRateBottamSheet()
//    }
//    @IBAction func txtFieldMinThersholdOpen(_ sender: UITextField) {
////        activeTextField = txtFieldMinThershold
////        minThersholdBottamSheet()
//    }
    @IBAction func btnMinThersholdPressed(_ sender: UIButton) {
        activeTextField = txtFieldMinThershold
        minThersholdBottamSheet()
    }
    @IBAction func btnBaseratePressed(_ sender: UIButton) {
        activeTextField = txtFieldBaseRate
        baseRateBottamSheet()
    }
    @IBAction func btnMaxThershold(_ sender: UIButton) {
        activeTextField = txtmaxThershold
        maxThersholdBottamSheet()
    }
    @IBAction func btnExtraAdultRate(_ sender: UIButton) {
        activeTextField = txtFieldExtraAdultRate
        extraAdultRateBottamSheet()
    }
    @IBAction func btnExtraChildRate(_ sender: UIButton) {
        activeTextField = txtFieldExtraCHild
        extraChildRateBottamSheet()
    }
}

// MARK: - Extension tableView
extension ChargesAndPlanes2VC:UITableViewDelegate,UITableViewDataSource{
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return arrRate.count
 }

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "ChargesAndPlanesTableCell", for: indexPath) as! ChargesAndPlanesTableCell
     cell.txtFieldDeluxeCP.text = arrDeluxeCP[indexPath.row]
     cell.txtField6Inclusion.text = arrInclusions[indexPath.row]
     cell.txtField3600.text = arrRate[indexPath.row]
     cell.txtFIeldRatePlaneTottal.text = arrRatePlane[indexPath.row]
     cell.deleteBtnClicked = {[weak self] in
         self?.deleteItem(at: indexPath)
     }
     
     cell.editBtnClicked = {[weak self] in
         cell.txtField3600.isUserInteractionEnabled = true
         cell.txtField6Inclusion.isUserInteractionEnabled = true
         cell.txtFIeldRatePlaneTottal.isUserInteractionEnabled = true
         cell.txtFieldDeluxeCP.isUserInteractionEnabled = true
     }
     return cell
 }

}
