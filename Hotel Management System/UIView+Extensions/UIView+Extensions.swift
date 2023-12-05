//
//  UIView+Extensions.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 09/11/23.
//



import Foundation
import UIKit

extension UIView{
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    
    func makeCircular() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.clipsToBounds = true
    }
    
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func addShadow(color: UIColor, shadowRadius:CGFloat = 5, shadowOffest:CGSize = CGSize(width: 0, height: 3)) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = shadowOffest
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = shadowRadius
        self.layer.masksToBounds = false
    }
    
    func rounded() {
        layer.cornerRadius = self.frame.height/2
        layer.masksToBounds = true
    }
    
    func rounded(with cornerRadious: CGFloat) {
        layer.cornerRadius = cornerRadious
        layer.masksToBounds = true
    }
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
    
    
    // For insert layer in Foreground
    func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.addSublayer(gradient)
    }
    // For insert layer in background
    func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func addDashedBorder(_ color: UIColor = #colorLiteral(red: 0.05490196078, green: 0.09411764706, blue: 0.137254902, alpha: 0.25), withWidth width: CGFloat = 1, cornerRadius: CGFloat = 25, dashPattern: [NSNumber] = [5,5]) {
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.bounds = bounds
        shapeLayer.position = CGPoint(x: bounds.width/2, y: bounds.height/2)
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        shapeLayer.lineJoin = CAShapeLayerLineJoin.miter // Updated in swift 4.2
        shapeLayer.lineDashPattern = dashPattern
        shapeLayer.lineCap = .butt
        shapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func showAnimation(){
        self.frame.origin.y = UIScreen.main.bounds.size.height
        UIView.animate(withDuration: 1.5, animations: {
            self.frame.origin.y = 0
        }) { (true) in
          
        }
    }
    func setRoundView(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        clipsToBounds = true
    }
    
    /**
     *  Pins the subview of the receiver to the edge of its frame, as specified by the given attribute, by adding a layout constraint.
     *
     *  @param subview   The subview to which the receiver will be pinned.
     *  @param attribute The layout constraint attribute specifying one of `NSLayoutAttributeBottom`, `NSLayoutAttributeTop`, `NSLayoutAttributeLeading`, `NSLayoutAttributeTrailing`.
     */
    func pinSubview(_ subview: UIView?, toEdge attribute: NSLayoutConstraint.Attribute) {
        addConstraint(NSLayoutConstraint(item: self,
                                         attribute: attribute,
                                         relatedBy: .equal,
                                         toItem: subview,
                                         attribute: attribute,
                                         multiplier: 1.0,
                                         constant: 0.0))
    }
    
    /**
    *  Pins all edges of the specified subview to the receiver.
    *
    *  @param subview The subview to which the receiver will be pinned.
    */
    func pinAllEdges(ofSubview subview: UIView?) {
        pinSubview(subview, toEdge: .bottom)
        pinSubview(subview, toEdge: .top)
        pinSubview(subview, toEdge: .leading)
        pinSubview(subview, toEdge: .trailing)
    }
    func takeScreenshot() -> UIImage {

          // Begin context
          UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

          // Draw view in that context
          drawHierarchy(in: self.bounds, afterScreenUpdates: true)

          // And finally, get image
          let image = UIGraphicsGetImageFromCurrentImageContext()
          UIGraphicsEndImageContext()

          if (image != nil)
          {
              return image!
          }
          return UIImage()
      }
    
    
}


extension Array {
    
    func isValidIndex(index: Int) -> Bool {
        
        if [Int](0..<self.count).contains(index) {
            return true
        }
        return false
    }
    
}




extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
            print("Close")
        })
        alert.addAction(closeAction)
        self.present(alert, animated: true, completion: nil)
        }
    
    
    
    // MARK: - Email Validation
    func isValidEmail(email: String) -> Bool {
        // Simple email validation using regular expression
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
    func isValidName(name: String) -> Bool {
        // Simple name validation: non-empty and contains only letters
        let nameRegex = "^[a-zA-Z]+$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return !name.isEmpty && namePredicate.evaluate(with: name)
    }
    
    func isValidLastName(lastName: String) -> Bool {
        // Simple name validation: non-empty and contains only letters
        let nameRegex = "^[a-zA-Z]+$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return !lastName.isEmpty && namePredicate.evaluate(with: lastName)
    }
    
    
    func isValidUsername(username: String) -> Bool {
        // Simple username validation: non-empty and contains only alphanumeric characters
        let usernameRegex = "^[a-zA-Z0-9]+$"
        let usernamePredicate = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        return !username.isEmpty && usernamePredicate.evaluate(with: username)
    }
    
    func isValidHotelCode(code: String) -> Bool {
        // Simple hotel code validation: non-empty
        return !code.isEmpty
    }
    func isValidPhoneNumber(phoneNumber: String) -> Bool {
        // Simple phone number validation using regular expression
        let phoneRegex = "^\\d{10}$"
        
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phoneNumber) && phoneNumber.count  == 9
    }
    
    func isValidPIN(_ pin: String) -> Bool {
            return pin.count == 6
        }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^A-Za-z\\d]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}
