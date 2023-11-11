//
//  CreateRoomVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 04/11/23.
//

import UIKit

class CreateRoomVC: UIViewController {
    
    // MARK: - OUTLET

    @IBOutlet weak var viewRoomType: UIView!
    @IBOutlet weak var txtFieldRoomType: UITextField!
    @IBOutlet weak var viewShortCOde: UIView!
    @IBOutlet weak var txtFieldShortCode: UITextField!
    @IBOutlet weak var viewBaeType: UIView!
    @IBOutlet weak var txtFiledBaeType: UITextField!
    @IBOutlet weak var viewOccupationBaseAdult: UIView!
    @IBOutlet weak var lbloccupationBaseAdult: UILabel!
    @IBOutlet weak var viewBaseChild: UIView!
    @IBOutlet weak var lblOccupationBaseChild: UILabel!
    @IBOutlet weak var viewMaxOccupancy: UIView!
    @IBOutlet weak var lblMaxOccupancy: UILabel!
    @IBOutlet weak var viewMaxAdults: UIView!
    @IBOutlet weak var lblMaxAdults: UILabel!
    @IBOutlet weak var viewMaxChild: UIView!
    @IBOutlet weak var lblMaxChild: UILabel!
    @IBOutlet weak var viewMinRate: UIView!
    @IBOutlet weak var lblMinRate: UILabel!
    @IBOutlet weak var viewBaseRate: UIView!
    @IBOutlet weak var lblBaseRate: UILabel!
    @IBOutlet weak var viewMaxRate: UIView!
    @IBOutlet weak var lblMaxRate: UILabel!
    @IBOutlet weak var viewExtraAdultRate: UIView!
    @IBOutlet weak var lblExtraAdultRate: UILabel!
    @IBOutlet weak var viewExtraChildRate: UIView!
    @IBOutlet weak var lblExtraChildRate: UILabel!
    @IBOutlet weak var createRoomsCollectionView: UICollectionView!
    
    
    
    var baseAdult:Int = 0{
        didSet{
            lbloccupationBaseAdult.text = "\(baseAdult)"
        }
    }
    
    var baseChild:Int = 0{
        didSet{
            lblOccupationBaseChild.text = "\(baseChild)"
        }
    }
    
    var maxOccupation:Int = 0{
        didSet{
            lblMaxOccupancy.text = "\(maxOccupation)"
        }
    }
    
    
    var maxAdults:Int = 0{
        didSet{
            lblMaxAdults.text = "\(maxAdults)"
        }
    }
    
    var maxChild:Int = 0{
        didSet{
            lblMaxChild.text = "\(maxChild)"
        }
    }
    
    var minRate:Int = 0{
        didSet{
            lblMinRate.text = "\(minRate)"
        }
    }
    
    
    var baseRate:Int = 0{
        didSet{
            lblBaseRate.text = "\(baseRate)"
        }
    }
 
    var maxRate:Int = 0{
        didSet{
            lblMaxRate.text = "\(maxRate)"
        }
    }
    
    
    var extraAdultRate:Int = 0{
        didSet{
            lblExtraAdultRate.text = "\(extraAdultRate)"
        }
    }
    
    var extraAdultChildRate:Int = 0{
        didSet{
            lblExtraChildRate.text = "\(extraAdultChildRate)"
        }
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBaeType.layer.borderWidth = 1
       viewBorderLine()
        createRoomsCollectionView.register(UINib(nibName: "CreateRoomCollectionCell", bundle: .main), forCellWithReuseIdentifier: "CreateRoomCollectionCell")
    }
    
    
    
    // MARK: - Function

    func viewBorderLine(){
        viewRoomType.layer.borderWidth = 1
        viewRoomType.layer.borderColor = UIColor.init(named: "BorderColor")?.cgColor
        viewRoomType.layer.cornerRadius = 10
        
        viewShortCOde.layer.borderWidth = 1
        viewShortCOde.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewShortCOde.layer.cornerRadius = 10
        
        viewBaeType.layer.borderWidth = 1
        viewBaeType.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewBaeType.layer.cornerRadius = 10
        
        viewOccupationBaseAdult.layer.borderWidth = 1
        viewOccupationBaseAdult.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewOccupationBaseAdult.layer.cornerRadius = 10
        
        viewBaseChild.layer.borderWidth = 1
        viewBaseChild.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewBaseChild.layer.cornerRadius = 10
        
        viewMaxOccupancy.layer.borderWidth = 1
        viewMaxOccupancy.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewMaxOccupancy.layer.cornerRadius = 10
        
        viewMaxAdults.layer.borderWidth = 1
        viewMaxAdults.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewMaxAdults.layer.cornerRadius = 10
        
        viewMaxAdults.layer.borderWidth = 1
        viewMaxAdults.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewMaxAdults.layer.cornerRadius = 10
        
        viewMaxChild.layer.borderWidth = 1
        viewMaxChild.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewMaxChild.layer.cornerRadius = 10
        
        viewMinRate.layer.borderWidth = 1
        viewMinRate.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewMinRate.layer.cornerRadius = 10
        
        viewBaseRate.layer.borderWidth = 1
        viewBaseRate.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewBaseRate.layer.cornerRadius = 10
        
        viewMaxRate.layer.borderWidth = 1
        viewMaxRate.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewMaxRate.layer.cornerRadius = 10
        
        viewExtraAdultRate.layer.borderWidth = 1
        viewExtraAdultRate.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewExtraAdultRate.layer.cornerRadius = 10
        
        viewExtraChildRate.layer.borderWidth = 1
        viewExtraChildRate.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewExtraChildRate.layer.cornerRadius = 10
        
        baseAdult = 1
        baseChild = 1
        maxOccupation = 1
        maxAdults = 1
        maxChild = 1
        maxRate = 1000
        minRate = 1000
        baseRate = 1000
        extraAdultRate = 1000
        extraAdultChildRate = 1000
       
        
    }
    
    // MARK: - Action


    @IBAction func OccupationAddBaseAdultBtnPressed(_ sender: UIButton) {
        baseAdult += 1
    }
    @IBAction func OccupationRemoveBaseAdultBtnPressed(_ sender: UIButton) {
        baseAdult -= 1
    }
    @IBAction func OccupationAddBaseChildBtnPressed(_ sender: UIButton) {
        baseChild += 1
    }
    @IBAction func OccupationRemoveBaseChildBtnPressed(_ sender: UIButton) {
        baseChild -= 1
    }
    @IBAction func maxOccupationAddBtnPressed(_ sender: UIButton) {
        maxOccupation += 1
    }
    @IBAction func maxOccupationRemoveBtnPressed(_ sender: UIButton) {
        maxOccupation -= 1
    }
    
    @IBAction func maxAdultsAddBtnPressed(_ sender: UIButton) {
        maxAdults += 1
    }
    @IBAction func maxAdultsRemoveBtnPressed(_ sender: UIButton) {
        maxAdults -= 1

    }
    @IBAction func maxChildAddBtnPressed(_ sender: UIButton) {
        maxChild += 1
    }
    @IBAction func maxChildRemoveBtnPressed(_ sender: UIButton) {
        maxChild -= 1
    }
    @IBAction func minRatesAddBtnPressed(_ sender: UIButton) {
        minRate += 1000
    }
    @IBAction func minRatesRemoveBtnPressed(_ sender: UIButton) {
        minRate -= 1000
    }
    @IBAction func baseRatesAddBtnPressed(_ sender: UIButton) {
        baseRate += 1000
    }
    @IBAction func BaseRatesRemoveBtnPressed(_ sender: UIButton) {
        baseRate -= 1000
    }
    @IBAction func maxRateAddBtnPressed(_ sender: UIButton) {
        maxRate += 1000
    }
    @IBAction func maxRateRemoveBtnPressed(_ sender: UIButton) {
        maxRate -= 1000
    }
    @IBAction func extraAdultRateAddBtnPressed(_ sender: UIButton) {
        extraAdultRate += 1000
    }
    @IBAction func extraAdultRateRemoveBtnPressed(_ sender: UIButton) {
        extraAdultRate -= 1000
    }
    @IBAction func extraChildRateAddBtnPressed(_ sender: UIButton) {
        extraAdultChildRate += 1000
    }
    @IBAction func extraChildRateRemoveBtnPressed(_ sender: UIButton) {
        extraAdultChildRate -= 1000
    }
    
}

// MARK: - Extension
extension CreateRoomVC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateRoomCollectionCell", for: indexPath) as! CreateRoomCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
       
            return UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
        
        }
    
}
