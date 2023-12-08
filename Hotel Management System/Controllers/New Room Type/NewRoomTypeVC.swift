//
//  NewRoomTypeVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 14/11/23.
//

import UIKit



class NewRoomTypeVC: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var btnDescription: UIButton!
    @IBOutlet weak var btnInventory: UIButton!
    @IBOutlet weak var btnChild: UIButton!
    @IBOutlet weak var btnAdults: UIButton!
    @IBOutlet weak var btnMaxOccupancy: UIButton!
    @IBOutlet weak var btnThirdBedType: UIButton!
    @IBOutlet weak var btnSecondBedTtpe: UIButton!
    @IBOutlet weak var btnFirstBed: UIButton!
    @IBOutlet weak var shortCodeBtn: UIButton!
    @IBOutlet weak var btnRoomType: UIButton!
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var txtFieldRoomTypeName: UITextField!
    @IBOutlet weak var txtFieldBHR: UITextField!
    @IBOutlet weak var txtFieldRoomTypeInventory: UITextField!
    @IBOutlet weak var txtField1stBedType: UITextField!
    @IBOutlet weak var txtField2ndBedType: UITextField!
    @IBOutlet weak var txtFIeld3rdBedType: UITextField!
    @IBOutlet weak var txtFieldMaxOccupancy: UITextField!
    @IBOutlet weak var txtFieldAdults: UITextField!
    @IBOutlet weak var txtFIeldChild: UITextField!
    @IBOutlet weak var txtfieldDes: UITextField!
    @IBOutlet weak var newRoomTypeCollectionCell: UICollectionView!
    // MARK: - Varriable
    let userDefaults = UserDefaults.standard
    var activeTextField: UITextField?
    var textFields: [UITextField] = []
    var textfieldValue:String?
    var arrDate = ["Child-friendly", "Ocean View", "Day Care", "Child-friendly","Child-friendly", "Ocean View", "Day Care", "Child-friendly"]
    var currentIndex: Int = 0
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
     textFieldplaceholderColorChange()
        newRoomTypeCollectionCell.register(UINib(nibName: "NewRoomTypeCollectionCell", bundle: .main), forCellWithReuseIdentifier: "NewRoomTypeCollectionCell")
        newRoomTypeCollectionCell.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Function
    
    func textFieldplaceholderColorChange(){
        let color = UIColor.init(named: "TextColor")
        txtFieldRoomTypeName.attributedPlaceholder = NSAttributedString(string: txtFieldRoomTypeName.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldBHR.attributedPlaceholder = NSAttributedString(string: txtFieldBHR.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldRoomTypeInventory.attributedPlaceholder = NSAttributedString(string: txtFieldRoomTypeInventory.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtField1stBedType.attributedPlaceholder = NSAttributedString(string: txtField1stBedType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtField2ndBedType.attributedPlaceholder = NSAttributedString(string: txtField2ndBedType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFIeld3rdBedType.attributedPlaceholder = NSAttributedString(string: txtFIeld3rdBedType.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldMaxOccupancy.attributedPlaceholder = NSAttributedString(string: txtFieldMaxOccupancy.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldAdults.attributedPlaceholder = NSAttributedString(string: txtFieldAdults.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFIeldChild.attributedPlaceholder = NSAttributedString(string: txtFIeldChild.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtfieldDes.attributedPlaceholder = NSAttributedString(string: txtfieldDes.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    
    func deleteItem(at indexPath: IndexPath) {
        if arrDate.count > 0 {
            arrDate.remove(at: indexPath.row)
        }
        DispatchQueue.main.async {
            self.newRoomTypeCollectionCell.reloadData()
        }
    }

    func onUserAction(data: [String]) {
        for data in data {
            arrDate.append(data)
        }
        newRoomTypeCollectionCell.reloadData()
        print(arrDate)
    }
    
    func cancelBtnTapped(){
        dismiss(animated: true, completion: nil)
    }
    func roomTypeBottamSheet(){
        let bottomSheetVC = PropertyNamePop(nibName: "PropertyNamePop", bundle: nil)
      bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelPropertyName = "Room Type Name"
        bottomSheetVC.labelPropertyDescription = "This is the specific category or name assigned to this type of room, helping guests easily distinguish between different accommodations."
        present(bottomSheetVC, animated: true, completion: nil)
        bottomSheetVC.saveBtnClicked = { [weak self] text in
            self?.activeTextField?.text = text
        }
    }
   
    func shortCodeBHRBottamSheet(){
        let bottomSheetVC = PropertyNamePop(nibName: "PropertyNamePop", bundle: nil)
      bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelPropertyName = "Short Code"
       
        bottomSheetVC.labelPropertyDescription = "A quick code for this room type, making it easy to identify and manage."
        present(bottomSheetVC, animated: true, completion: nil)
        bottomSheetVC.saveBtnClicked = { [weak self] text in
            self?.activeTextField?.text = text
        }
    } 
    func inventoryBottamSheet(){
        let bottomSheetVC = InventoryPops(nibName: "InventoryPops", bundle: nil)
        bottomSheetVC.modalPresentationStyle = .overCurrentContext
        present(bottomSheetVC, animated: true, completion: nil)
        bottomSheetVC.saveBtnClicked = {[weak self] text in
            self?.activeTextField?.text = text
        }
    }
    func firstBedTypeBottamSheet(){
        let bottomSheetVC = BedTypePops(nibName: "BedTypePops", bundle: nil)
        bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelBedType = "1st Bed Type"
        bottomSheetVC.labelDescriptionBed = "This is the type of bed provided in this room, offering guests a choice for their stay."
        bottomSheetVC.onPickerSelection = { [weak self] selectedValue in
        self?.txtField1stBedType.text = selectedValue
        }
        present(bottomSheetVC, animated: true, completion: nil)
    }
    func secondBedTypeBottamSheet(){
        let bottomSheetVC = BedTypePops(nibName: "BedTypePops", bundle: nil)
        bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelBedType = "1st Bed Type"
        bottomSheetVC.labelDescriptionBed = "This is the type of bed provided in this room, offering guests a choice for their stay."
        bottomSheetVC.onPickerSelection = { [weak self] selectedValue in
        self?.txtField2ndBedType.text = selectedValue
        }
        present(bottomSheetVC, animated: true, completion: nil)
    }
    func thirdBedTypeBottamSheet(){
        let bottomSheetVC = BedTypePops(nibName: "BedTypePops", bundle: nil)
        bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelBedType = "1st Bed Type"
        bottomSheetVC.labelDescriptionBed = "This is the type of bed provided in this room, offering guests a choice for their stay."
        bottomSheetVC.onPickerSelection = { [weak self] selectedValue in
        self?.txtFIeld3rdBedType.text = selectedValue
        }
        present(bottomSheetVC, animated: true, completion: nil)
    }
    func NumberOfBedBottamSheet(){
        let bottomSheetVC = NumberOfBedPops(nibName: "NumberOfBedPops", bundle: nil)
        bottomSheetVC.modalPresentationStyle = .overCurrentContext
        present(bottomSheetVC, animated: true, completion: nil)
    }
    
//    func addTextField(with text: String) {
//           let newTextField = UITextField()
//           txtFieldMaxOccupancy.text = text
//           textFields.append(txtFieldMaxOccupancy)
//       }
    func maxOccupancyBottamSheet(){
        let bottomSheetVC = NumberOfBedPops(nibName: "NumberOfBedPops", bundle: nil)
        bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelNumberOfBed = "Max Occupancy"
        bottomSheetVC.labelDescriptionBed = "This is the maximum number of guests the room is designed to accommodate."
        present(bottomSheetVC, animated: true, completion: nil)
        bottomSheetVC.onPickerSelection = { [weak self] selectedValue in
        self?.txtFieldMaxOccupancy.text = selectedValue
        }
    }
    
    
    func NumberOfAdultsBottamSheet(){
        let bottomSheetVC = AdultsPops(nibName: "AdultsPops", bundle: nil)
        bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelAdults = "Adults"
        bottomSheetVC.labelAdultsDescription = "This is the base and max number of adult guests the room is designed to accommodate."
        bottomSheetVC.onPickerSelection = { [weak self] selectedValue in
        self?.txtFieldAdults.text = selectedValue
        }
        present(bottomSheetVC, animated: true, completion: nil)
    }
    func NumberOfChidBottamSheet(){
        let bottomSheetVC = AdultsPops(nibName: "AdultsPops", bundle: nil)
        bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelAdults = "Child"
        bottomSheetVC.labelAdultsDescription = "This is the base and max number of adult guests the room is designed to accommodate."
        bottomSheetVC.onPickerSelection = { [weak self] selectedValue in
        self?.txtFIeldChild.text = selectedValue
        }
        present(bottomSheetVC, animated: true, completion: nil)
    }
    
    func descriptionBottamSheet(){
        let bottomSheetVC = PropertyNamePop(nibName: "PropertyNamePop", bundle: nil)
      bottomSheetVC.modalPresentationStyle = .overCurrentContext
        bottomSheetVC.labelPropertyName = "Room’s Description"
        bottomSheetVC.labelPropertyDescription = "This is a brief overview of what makes this room special, helping guests envision their stay.."
        present(bottomSheetVC, animated: true, completion: nil)
        bottomSheetVC.saveBtnClicked = { [weak self] text in
            self?.activeTextField?.text = text
        }
    }
   
    func didEnterValue(_ value: String) {
        txtFieldRoomTypeName.text = value
       }
    
    func saveBtnTapped(){
        self.dismiss(animated: true, completion: nil)
        shortCodeBHRBottamSheet()
        print("Button clicked")
    }
    
    func coreData(){
        let context = (UIApplication.shared.delegate as!
        AppDelegate).persistentContainer.viewContext
        let userEntity = CreateRoomEntity(context: context)
        userEntity.roomTypeName = txtFieldRoomTypeName.text
        userEntity.shortCode = txtFieldBHR.text
        userEntity.roomTypeInventory = txtFieldRoomTypeInventory.text
        userEntity.firstBed = txtField1stBedType.text
        userEntity.secondBed = txtField2ndBedType.text
        userEntity.thirdBed = txtFIeld3rdBedType.text
        userEntity.maxOccupancy = txtFieldMaxOccupancy.text
        userEntity.adults = txtFieldAdults.text
        userEntity.child = txtFIeldChild.text
        do{
            try context.save()
        }catch{
            print("user saving eroor", error)
        }
    }

    @IBAction func navigationBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    // MARK: - Action
    @IBAction func propertyAmenityAddBtnPresssed(_ sender: UIButton) {
        descriptionBottamSheet()
    }
    
    @IBAction func btnAddPressed(_ sender: UIButton) {
        newRoomTypeCollectionCell.reloadData()
        onUserAction(data: arrDate)
        
    }
    // MARK: - navigation Next Button
    @IBAction func btnNavigationNextPressed(_ sender: UIButton) {
        coreData()
        UserDefaults.standard.set(txtFieldRoomTypeName.text, forKey: "roomTypeName")
        UserDefaults.standard.set(txtfieldDes.text, forKey: "des")
        UserDefaults.standard.set(txtFieldBHR.text, forKey: "BHR")
        UserDefaults.standard.set(txtFIeldChild.text, forKey: "child")
        UserDefaults.standard.set(txtFieldAdults.text, forKey: "adult")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChargesAndPlanes2VC") as! ChargesAndPlanes2VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBAction func btnRoomtypeNamePressed(_ sender: Any) {
        activeTextField = txtFieldRoomTypeName
        roomTypeBottamSheet()
    }
    @IBAction func shortCodeBtnPressed(_ sender: Any) {
        activeTextField = txtFieldBHR
        shortCodeBHRBottamSheet()
    }
    @IBAction func btnInventortPressed(_ sender: UIButton) {
        activeTextField = txtFieldRoomTypeInventory
        inventoryBottamSheet()
    }
    @IBAction func btnFirstBedtTypePressed(_ sender: UIButton) {
        activeTextField = txtField1stBedType
        firstBedTypeBottamSheet()
    }
    @IBAction func btnSecondBedTypePressed(_ sender: UIButton) {
        activeTextField = txtField2ndBedType
        secondBedTypeBottamSheet()
    }
    @IBAction func btnThirdBedType(_ sender: UIButton) {
        activeTextField = txtFIeld3rdBedType
        thirdBedTypeBottamSheet()
    }
    @IBAction func btnOccupancyPressed(_ sender: UIButton) {
        activeTextField = txtFieldMaxOccupancy
        maxOccupancyBottamSheet()
    }
    @IBAction func btnAdultsPressed(_ sender: UIButton) {
        activeTextField = txtFieldAdults
        NumberOfAdultsBottamSheet()
    }
    @IBAction func btnChildPressed(_ sender: UIButton) {
        activeTextField = txtFIeldChild
        NumberOfChidBottamSheet()
    }
    @IBAction func btnDescriptionPressed(_ sender: UIButton) {
        activeTextField = txtfieldDes
        descriptionBottamSheet()
    }
}

// MARK: - Extension
extension NewRoomTypeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return self.generateChatModule()
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        layout.configuration = config
        return layout
    }
    func generateChatModule() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/2),
            heightDimension: .fractionalHeight(1.0))
        
        
        let fullPhotoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(60))
        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 0,leading: 0,bottom: 5,trailing: 0)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: fullPhotoItem,
            count: 2
        )
        
        let section = NSCollectionLayoutSection(group: group)
       
        return section
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewRoomTypeCollectionCell", for: indexPath) as! NewRoomTypeCollectionCell
               cell.childLbl.text = arrDate[indexPath.row]
        cell.btnDeleteClicked = { [weak self] in
            self?.deleteItem(at: indexPath)
        }
                return cell
    }
}

extension NewRoomTypeVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
            
        
        }

}

