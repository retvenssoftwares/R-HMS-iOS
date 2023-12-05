//
//  SelectMealPlanePops.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 22/11/23.
//

import UIKit
import IQKeyboardManagerSwift

class SelectMealPlanePops: UIViewController {
    

    // MARK: - Outlet
    @IBOutlet weak var lblSelectMealPlane: UILabel!
    @IBOutlet weak var lblSelectMealPlaneDescription: UILabel!
    @IBOutlet weak var viewEuropeanPlane: UIView!
    @IBOutlet weak var viewAmericanPlane: UIView!
    @IBOutlet weak var viewContinentalPlane: UIView!
    @IBOutlet weak var viewModifiedAmericanaPlane: UIView!
    @IBOutlet weak var viewFullBoard: UIView!
    @IBOutlet weak var viewRoomOnly: UIView!
    @IBOutlet weak var lblEuropeanPlane: UILabel!
    @IBOutlet weak var lblAmericanaPlane: UILabel!
    @IBOutlet weak var lblContinentalPlane: UILabel!
    @IBOutlet weak var lblModifiedAmericanaPlane: UILabel!
    @IBOutlet weak var lblFullBoard: UILabel!
    @IBOutlet weak var lblRoomOnly: UILabel!
    @IBOutlet weak var btnEuropeanPlan: UIButton!
    @IBOutlet weak var btnAmericanaPlan: UIButton!
    @IBOutlet weak var btnContinentalPlane: UIButton!
    @IBOutlet weak var btnModifiedAmericanaPlane: UIButton!
    @IBOutlet weak var btnFullboard: UIButton!
    @IBOutlet weak var btnRoomOnly: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var stackViewSaveCancelBtn: UIStackView!
    
    var btnEuropeanPlaneClicked:(()->Void)?
    var btnAmericanaPlaneClicked:((String)->Void)?
    var btnModifiedAmericanaPlaneClicked:(()->Void)?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 300
    }
    
    // MARK: - Action
    @IBAction func btnEuropeanPlanePressed(_ sender: UIButton) {
        btnEuropeanPlaneClicked?()
    }
    @IBAction func btnAmericanaPlanePressed(_ sender: UIButton) {
        btnAmericanaPlaneClicked?("Abc")
    }
    @IBAction func btnContinentalPlane(_ sender: UIButton) {
        btnModifiedAmericanaPlaneClicked?()
    }
    @IBAction func btnModifiedAmericanaPlanePressed(_ sender: UIButton) {
    }
    @IBAction func btnFullBoardPressed(_ sender: UIButton) {
    }
    @IBAction func btnRoomOnlyPressed(_ sender: UIButton) {
    }
    @IBAction func btnSavePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnCancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
