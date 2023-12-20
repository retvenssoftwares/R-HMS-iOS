//
//  ChargesPlanes1VC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 13/11/23.
//

import UIKit

class ChargesPlanes1VC: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var chargeScrollView: UIScrollView!
    @IBOutlet weak var lblRoomRate: UILabel!
    @IBOutlet weak var lblExtraAdultRate: UILabel!
    @IBOutlet weak var lblMaxThreshold: CustomLabel!
    @IBOutlet weak var lblBaseRate: UILabel!
    @IBOutlet weak var lblMinThreshold: UILabel!
    @IBOutlet weak var chargesPlanesTableView: UITableView!
    @IBOutlet weak var sliderRoomRate: UISlider!
    @IBOutlet weak var sliderExtraAdultRate: UISlider!
    @IBOutlet weak var sliderMaxThershold: UISlider!
    @IBOutlet weak var sliderBaseRate: UISlider!
    @IBOutlet weak var sliderMinThershold: UISlider!
    
    
    let maxValue: Float = 100000
    
    var arrDeluxeCP = ["Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP"]
    
    var arrRatePlane = ["Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal"]
    var arrInclusions = ["6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions","Inclusions","Inclusions"]
    var arrRate = ["₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00"]
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        chargesPlanesTableView.register(UINib(nibName: "ChargesAndPlanesTableCell", bundle: nil), forCellReuseIdentifier: "ChargesAndPlanesTableCell")
//        progressBarUpdateBar()
        sliderBaseRate.maximumValue = 100000
        
        sliderMinThershold.value = 30000
        sliderMinThershold.addTarget(self, action: #selector(minThersholdValueChanged(_:)), for: .valueChanged)
        
        sliderBaseRate.value = 12999
        sliderBaseRate.addTarget(self, action: #selector(baseRateValueChanged(_:)), for: .valueChanged)
        
        sliderMaxThershold.value = 10000
        sliderMaxThershold.addTarget(self, action: #selector(maxThersholdValueChanged(_:)), for: .valueChanged)
        
        sliderRoomRate.value = 20000
        sliderRoomRate.addTarget(self, action: #selector(extraAdultRateValueChanged(_:)), for: .valueChanged)
        
        sliderExtraAdultRate.value = 30000
        sliderExtraAdultRate.addTarget(self, action: #selector(extraChildRateValueChanged(_:)), for: .valueChanged)
    }
    

    
    // MARK: - Function
    @objc func minThersholdValueChanged (_ sender: UISlider) {
            let sliderValue = Int(sender.value)
            lblMinThreshold.text = "₹\(sliderValue).00"
        }
    
    @objc func baseRateValueChanged(_ sender: UISlider) {
            let sliderValue = Int(sender.value)
            lblBaseRate.text = "₹\(sliderValue).00"
        }
    @objc func maxThersholdValueChanged(_ sender: UISlider) {
            let sliderValue = Int(sender.value)
            lblMaxThreshold.text = "₹\(sliderValue).00"
        }
    @objc func extraChildRateValueChanged(_ sender: UISlider) {
            let sliderValue = Int(sender.value)
            lblBaseRate.text = "₹\(sliderValue).00"
        }

    @objc func extraAdultRateValueChanged(_ sender: UISlider) {
            let sliderValue = Int(sender.value)
            lblExtraAdultRate.text = "₹\(sliderValue).00"
        }
    
  
    func editBtnTapped(){
    
    }
    func deleteItem(at indexPath: IndexPath) {
          
            arrRate.remove(at: indexPath.row)
            arrInclusions.remove(at: indexPath.row)
            arrDeluxeCP.remove(at: indexPath.row)
            arrRatePlane.remove(at: indexPath.row)
            chargesPlanesTableView.deleteRows(at: [indexPath], with: .fade)
        }
    // MARK: - Action
    @IBAction func btnnavigationBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNavigationNextPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChargesAndPlanes2VC") as! ChargesAndPlanes2VC

              
               vc.rate = lblRoomRate.text
               vc.base = lblBaseRate.text
               vc.min = lblMinThreshold.text
               vc.max = lblMaxThreshold.text
               vc.extra = lblExtraAdultRate.text

        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extension tableView
extension ChargesPlanes1VC:UITableViewDelegate,UITableViewDataSource{
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return arrDeluxeCP.count
 }

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "ChargesAndPlanesTableCell", for: indexPath) as! ChargesAndPlanesTableCell
     cell.txtFieldDeluxeCP.text = arrDeluxeCP[indexPath.row]
     cell.txtField6Inclusion.text = arrInclusions[indexPath.row]
     cell.txtField3600.text = arrRate[indexPath.row]
     cell.txtFIeldRatePlaneTottal.text = arrRatePlane[indexPath.row]
     
     cell.editBtnClicked = {[weak self] in
         cell.txtField3600.isUserInteractionEnabled = true
         cell.txtField6Inclusion.isUserInteractionEnabled = true
         cell.txtFIeldRatePlaneTottal.isUserInteractionEnabled = true
         cell.txtFieldDeluxeCP.isUserInteractionEnabled = true
     }
     cell.deleteBtnClicked = {[weak self] in
         self?.deleteItem(at: indexPath)
     }
     
     return cell
 }

}
