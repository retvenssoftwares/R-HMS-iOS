//
//  EditRatePlanes.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 14/11/23.
//

import UIKit
import iOSDropDown
import CoreData
struct Item {
    var title: String
}
class EditRatePlanes: UIViewController {
    
    // MARK: - Action
    @IBOutlet weak var btnMinRate: UIButton!
    @IBOutlet weak var btnRateCOde: UIButton!
    @IBOutlet weak var btnMealPlane: UIButton!
    @IBOutlet weak var lblExtraChildRate: UILabel!
    @IBOutlet weak var lblExtraAdultRate: UILabel!
    @IBOutlet weak var lblCHargeDetails: UILabel!
    @IBOutlet weak var txtFieldRoundUPDOwn: UITextField!
    @IBOutlet weak var txtFIeldInclusion: UITextField!
    @IBOutlet weak var txtFieldMealCharge: UITextField!
    @IBOutlet weak var lblRoomBaseRate: UILabel!
    @IBOutlet weak var viewMealPlane: UIView!
    @IBOutlet weak var viewRateCode: UIView!
    @IBOutlet weak var viewMinRate: UIView!
    @IBOutlet weak var txtFieldMinRate: UITextField!
    @IBOutlet weak var txtFieldRateCode: UITextField!
    
    @IBOutlet weak var txtFieldMealPlane: UITextField!
    @IBOutlet weak var editRateAndPlanesTableView: UITableView!
    
    var activeTextField: UITextField?
    var dataSource: [Int] = [1, 2, 3]
    var selectedIndexPath: IndexPath?
    var arrDeluxeCP = ["Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP","Deluxe CP (DLXCP"]
    
    var arrRatePlane = ["Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal","Rate Plane Tottal"]
    var arrInclusions = ["6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions","6 Inclusions","Inclusions","Inclusions"]
    var arrRate = ["₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00","₹ 3,600.00"]
    var dataArray: [Item] = []
    var roomType : String?
    var shortCode: String?
    var roomInventory: String?
    var numberOfBed: String?
    var firstBedTypeHotel: String?
    var secondBedTypeHotel: String?
    var ThirdBedTypeHotel: String?
    var maxoccupancy: String?
    var adult: String?
    var child: String?
    var des: String?
    var minthershold: String?
    var maxthershold: String?
    var extraAdult: String?
    var extraChild: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCoreDataData()
        textFieldPlaceholderTextColor()
        editRateAndPlanesTableView.register(UINib(nibName: "ChargesAndPlanesTableCell", bundle: nil), forCellReuseIdentifier: "ChargesAndPlanesTableCell")
        
        DispatchQueue.main.async {
            self.editRateAndPlanesTableView.reloadData()
        }
    }
    
    // MARK: - Function
    func textFieldPlaceholderTextColor(){
        let color = UIColor.init(named: "RatePlanesTableCellTextColor")
        txtFieldMinRate.attributedPlaceholder = NSAttributedString(string: txtFieldMinRate.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldRateCode.attributedPlaceholder = NSAttributedString(string: txtFieldRateCode.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldMinRate.attributedPlaceholder = NSAttributedString(string: txtFieldMinRate.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldMealCharge.attributedPlaceholder = NSAttributedString(string: txtFieldMealCharge.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFIeldInclusion.attributedPlaceholder = NSAttributedString(string: txtFIeldInclusion.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldRoundUPDOwn.attributedPlaceholder = NSAttributedString(string: txtFieldRoundUPDOwn.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
    }
    
    func deleteItem(at indexPath: IndexPath) {
        
        arrDeluxeCP.remove(at: indexPath.row)
        
        editRateAndPlanesTableView.deleteRows(at: [indexPath], with: .fade)
        DispatchQueue.main.async {
            self.editRateAndPlanesTableView.reloadData()
        }
    }
    
    func AddItem(at indexPath: IndexPath) {
        arrDeluxeCP.append(arrDeluxeCP[indexPath.row])
        editRateAndPlanesTableView.insertRows(at: [IndexPath(row: arrDeluxeCP.count - 1, section: 0)], with: .automatic)
        editRateAndPlanesTableView.reloadRows(at: [indexPath], with: .fade)
        DispatchQueue.main.async {
            self.editRateAndPlanesTableView.reloadData()
        }
    }
    func btnEuropeanPlanTapped(){
        txtFieldMealPlane.text = "European Plan"
        
    }
    func btnAmericanaPlaneClicked(){
        txtFieldMinRate.text = "Americana Plan"
        
    }
    
    
    func selectMealPlaneBottamSheet(){
        let bottomSheetVC = SelectMealPlanePops(nibName: "SelectMealPlanePops", bundle: nil)
        bottomSheetVC.modalPresentationStyle = .overCurrentContext
        present(bottomSheetVC, animated: true, completion: nil)
        if txtFieldMinRate.isFirstResponder == true{
            bottomSheetVC.btnEuropeanPlaneClicked = { [weak self] in
                self?.btnEuropeanPlanTapped()
                self?.dismiss(animated: true, completion: nil)
            }
        }else if txtFieldMinRate.isFirstResponder == true{
            
        }
       
        }
    
    @IBAction func BtnMealPlanePressed(_ sender: Any) {
        selectMealPlaneBottamSheet()
    }
    @IBAction func btnRateCodePressed(_ sender: UIButton) {
    }
    @IBAction func btnMinRatePressed(_ sender: UIButton) {
        
    }
    
    
   func fetchCoreDataData() {
            let context = CoreDataStack.shared.context
            let fetchRequest: NSFetchRequest<CreateRoomEntity> = CreateRoomEntity.fetchRequest()

            do {
                let fetchedData = try context.fetch(fetchRequest)
                for data in fetchedData {
                    if let propertyTypeName = data.roomTypeName{
                        roomType = propertyTypeName
                    }
                    shortCode = data.shortCode
                    roomInventory = data.roomTypeInventory
                    numberOfBed = data.noOfBed
                    firstBedTypeHotel = data.firstBed
                    secondBedTypeHotel = data.secondBed
                    ThirdBedTypeHotel = data.thirdBed
                    maxoccupancy = data.maxOccupancy
                    adult = data.adults
                    child = data.child
                    des = data.description
                    minthershold = data.minThershold
                    maxthershold = data.maxThershold
                    extraAdult = data.extraAdultRate
                    extraChild = data.extraChildRate
                    
                }
                print(fetchedData)
            } catch {
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    
    func fetchData(){
        APIManager.shared.postRequestRoom(userId: "vxYNlgcj", propertyId: "875485", roomTypeName:  roomType ?? "", shortCode: shortCode ?? "", noOfBeds: numberOfBed ?? "", maxOccupancy: maxoccupancy ?? "", roomDescription: des ?? "", minimumRate:  minthershold ?? "", maximumRate: maxthershold ?? "", extraAdultRate: extraAdult ?? "", extraChildRate: extraChild ?? "", baseAdult: adult ?? "", baseChild: child ?? "", authCode: "034c13295dc6740af5128a49e8a43918ed869d50ebf6d3438e03952830b67d850205ee215ce229b01699a5ddcc31653a5cc941ac972d0a53035c66c2014e8ecd") { model, error in
            DispatchQueue.main.async {
                if let m = model{
                    if m.statuscode == 200{
                       let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreatePropertyStap3VC") as! CreatePropertyStap3VC
                        self.navigationController?.pushViewController(vc, animated: true)
                        self.showAlert(message: m.message)
                        
                    }else{
                        print(error)
                    }
                }

            }
        }
    }
    
    
    // MARK: - Action
    
    
    @IBAction func btnEditMealPlanePressed(_ sender: UIButton) {
        txtFieldMealCharge.isUserInteractionEnabled = true
    }
    @IBAction func btnEditInclusionsPressed(_ sender: UIButton) {
        txtFIeldInclusion.isUserInteractionEnabled = true
    }
    
    @IBAction func btnEditRoundUp(_ sender: UIButton) {
        txtFieldRoundUPDOwn.isUserInteractionEnabled = true
    }
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        fetchData()
    }
    @IBAction func btnNavigationBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnAddPressed(_ sender: UIButton) {
        
        
    }
    
    
}


extension EditRatePlanes:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDeluxeCP.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChargesAndPlanesTableCell", for: indexPath) as! ChargesAndPlanesTableCell
        cell.txtFieldDeluxeCP.text = arrDeluxeCP[indexPath.row]
        
        cell.editBtnClicked = {[weak self] in
            self?.AddItem(at: indexPath)
            //                        cell.txtField3600.isUserInteractionEnabled = true
            //                        cell.txtField6Inclusion.isUserInteractionEnabled = true
            //                        cell.txtFIeldRatePlaneTottal.isUserInteractionEnabled = true
            //                        cell.txtFieldDeluxeCP.isUserInteractionEnabled = true
        }
        cell.deleteBtnClicked = {[weak self] in
            self?.deleteItem(at: indexPath)
        }
        //
        return cell
    }
    @objc func addCell(_ sender: UIButton) {
        
    }
    
    
    
}
