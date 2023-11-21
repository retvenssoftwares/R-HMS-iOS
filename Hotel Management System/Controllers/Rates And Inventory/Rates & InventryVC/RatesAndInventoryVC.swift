//
//  RatesAndInventoryVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 07/11/23.
//

import UIKit

class RatesAndInventoryVC: UIViewController {

  
    @IBOutlet weak var viewStopCell: UIView!
    @IBOutlet weak var viewRestications: UIView!
    @IBOutlet weak var viewInventory: UIView!
    @IBOutlet weak var viewRate: UIView!
    @IBOutlet weak var btnStopCell: UIButton!
    @IBOutlet weak var btnRestications: UIButton!
    @IBOutlet weak var btnInventory: UIButton!
    @IBOutlet weak var btnRate: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var ratesCollectionView: UICollectionView!
    @IBOutlet weak var viewCollectionView: UIView!
    @IBOutlet weak var viewAgodaDropDOwn: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        ratesCollectionView.register(UINib(nibName: "RatesAndInventoryCollectionCell", bundle: .main), forCellWithReuseIdentifier: "RatesAndInventoryCollectionCell")
        
        
        addSubView(storyBoard: "Main", controllerName: "RatesAndInventoryTableVC")
        let color = UIColor.init(named: "SementController")
        btnRate.setTitleColor(color, for: .normal)
        viewInventory.isHidden = true
        viewRestications.isHidden = true
        viewStopCell.isHidden = true
    }
    

    @IBAction func rateBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "RatesAndInventoryTableVC")
        let color = UIColor.init(named: "SementController")
        btnRate.setTitleColor(color, for: .normal)
        btnInventory.setTitleColor(.black, for: .normal)
        btnRestications.setTitleColor(.black, for: .normal)
        btnStopCell.setTitleColor(.black, for: .normal)
        viewInventory.isHidden = true
        viewRestications.isHidden = true
        viewStopCell.isHidden = true
        viewRate.isHidden = false
    }
    

    @IBAction func inventoryBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "InventoryVC")
        let color = UIColor.init(named: "SementController")
        btnInventory.setTitleColor(color, for: .normal)
        btnRate.setTitleColor(.black, for: .normal)
        btnRestications.setTitleColor(.black, for: .normal)
        btnStopCell.setTitleColor(.black, for: .normal)
        viewRate.isHidden = true
        viewRestications.isHidden = true
        viewStopCell.isHidden = true
        viewInventory.isHidden = false
        
    }
    @IBAction func resticationsBtnPressed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "ResticationsVC")
        let color = UIColor.init(named: "SementController")
        btnRestications.setTitleColor(color, for: .normal)
        btnInventory.setTitleColor(.black, for: .normal)
        btnRate.setTitleColor(.black, for: .normal)
        btnStopCell.setTitleColor(.black, for: .normal)
        viewRate.isHidden = true
        viewStopCell.isHidden = true
        viewInventory.isHidden = true
        viewRestications.isHidden = false
    }
    @IBAction func stopSellBtnPRessed(_ sender: UIButton) {
        addSubView(storyBoard: "Main", controllerName: "StopSellVC")
        let color = UIColor.init(named: "SementController")
        btnStopCell.setTitleColor(color, for: .normal)
        btnRate.setTitleColor(.black, for: .normal)
        btnInventory.setTitleColor(.black, for: .normal)
        btnRestications.setTitleColor(.black, for: .normal)
        viewRate.isHidden = true
        viewRestications.isHidden = true
        viewInventory.isHidden = true
        viewStopCell.isHidden = false
        
    }
}


extension RatesAndInventoryVC{
    func addSubView(storyBoard:String,controllerName:String){
        containerView.subviews.forEach({ $0.removeFromSuperview() })
        let storyBoard = UIStoryboard(name: storyBoard, bundle: nil)
        let showVC = storyBoard.instantiateViewController(withIdentifier: "\(controllerName)")
        showVC.view.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        containerView.addSubview(showVC.view)
        
        self.addChild(showVC)
    }
}



extension RatesAndInventoryVC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatesAndInventoryCollectionCell", for: indexPath) as! RatesAndInventoryCollectionCell
        cell.setData(no: indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/7, height: 100)
    }
    
}
