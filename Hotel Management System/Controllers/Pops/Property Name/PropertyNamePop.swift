//
//  PropertyNamePop.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 28/11/23.
//

import UIKit
import IQKeyboardManagerSwift



class PropertyNamePop: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var constHeightViewBg: NSLayoutConstraint!
    @IBOutlet weak var constHeightTextFieldView: NSLayoutConstraint!
    @IBOutlet var viewContainer: UIView!
    @IBOutlet weak var constStackViewbottam: NSLayoutConstraint!
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var lblPropertyName: UILabel!
    @IBOutlet weak var lblPropertyDescription: UILabel!
    @IBOutlet weak var viewpropertyName: UIView!
    @IBOutlet weak var txtFieldPropertyName: UITextField!
    
    // MARK: - Varriable
    var activeTextField : UITextField? = nil
    var labelPropertyName: String?
    var labelPropertyDescription: String?
    var saveBtnClicked:((String)->Void)?
    var cancelBtnClicked:(()->Void)?
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 300
        lblPropertyName.text = labelPropertyName
        lblPropertyDescription.text = labelPropertyDescription
        setupPanGesture()
    }
    // MARK: - Function
    private func setupPanGesture() {
           let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
           view.addGestureRecognizer(panGesture)
       }

       @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
           let translation = gesture.translation(in: view)

           switch gesture.state {
           case .changed:
               if translation.y >= 0 {
                   view.frame.origin.y = translation.y
               }
           case .ended:
               if translation.y >= view.frame.height * 0.25 {
                   dismiss(animated: true, completion: nil)
               } else {
                   UIView.animate(withDuration: 0.3) {
                       self.view.frame.origin.y = 0
                   }
               }
           default:
               break
           }
       }

    
   
   

    @objc private func buttonTapped() {
            saveBtnAction?()
    
        }

    private var saveBtnAction: (() -> Void)?

    // MARK: - Action
    @IBAction func btnCancelPressed(_ sender: UIButton) {
        cancelBtnClicked?()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnSavePressed(_ sender: Any) {
        if let text = txtFieldPropertyName.text {
            saveBtnClicked?(text)
            dismiss(animated: true, completion: nil)
        }
    }
}

