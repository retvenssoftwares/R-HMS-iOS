//
//  UIView+Extensions.swift
//  Hotel Management System
//
//  Created by mayur bobade on 09/11/23.
//



import Foundation
import UIKit
import Charts

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


enum Selection {
    case first
    case second
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
        let alertController = UIAlertController(title:  "Invalid Data", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                print("OK tapped")
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
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


class SemiCirclePieChartViews: UIView {

    var data: [(value: CGFloat, color: UIColor)] = [] {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        let center = CGPoint(x: rect.width / 2, y: rect.height)
        let radius = min(rect.width, rect.height) / 2

        var startAngle: CGFloat = 0
        var endAngle: CGFloat = CGFloat.pi

        for slice in data {
            let sliceAngle = CGFloat.pi * (slice.value / 100.0)

            endAngle += sliceAngle

            let path = UIBezierPath()
            path.move(to: center)
            path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.close()

            slice.color.setFill()
            path.fill()

            startAngle = endAngle
        }
    }
}

class SemiCirclePieChartView: UIView {

    var pieChartView: PieChartView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPieChart()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPieChart()
    }

    private func setupPieChart() {
        pieChartView = PieChartView()
        addSubview(pieChartView)

        // Apply circular mask to achieve semi-circle effect
        let circularMaskLayer = CAShapeLayer()
        circularMaskLayer.path = UIBezierPath(ovalIn: bounds).cgPath
        pieChartView.layer.mask = circularMaskLayer

        // Customize the appearance of the pie chart view
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pieChartView.topAnchor.constraint(equalTo: topAnchor),
            pieChartView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pieChartView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pieChartView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        // Additional customization if needed
        pieChartView.rotationEnabled = true
        pieChartView.chartDescription.enabled = false
        pieChartView.legend.enabled = false
        pieChartView.backgroundColor = UIColor.white
    
    }

    func updateChartData(entries: [PieChartDataEntry]) {
        let dataSet = PieChartDataSet(entries: entries, label: "Categories")
        dataSet.colors = ChartColorTemplates.joyful()

        let data = PieChartData(dataSet: dataSet)
        dataSet.drawValuesEnabled = false
        pieChartView.data = data
    }
    
}

class QuickStatusBarChartView: UIView {

    var barChartView: BarChartView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBarChart()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBarChart()
    }

    private func setupBarChart() {
        barChartView = BarChartView()
        addSubview(barChartView)

        // Customize the appearance of the bar chart view
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            barChartView.topAnchor.constraint(equalTo: topAnchor),
            barChartView.leadingAnchor.constraint(equalTo: leadingAnchor),
            barChartView.trailingAnchor.constraint(equalTo: trailingAnchor),
            barChartView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        // Additional customization if needed
        barChartView.chartDescription.enabled = false
        barChartView.drawGridBackgroundEnabled = false
        barChartView.legend.enabled = false

        // Customize X-axis and Y-axis if needed
        let xAxis = barChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)

        let leftAxis = barChartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.axisMinimum = 0
        leftAxis.granularity = 1

        let rightAxis = barChartView.rightAxis
        rightAxis.enabled = false
    }

    func updateChartData(entries: [BarChartDataEntry], labels: [String]) {
        let dataSet = BarChartDataSet(entries: entries, label: "Quick Status Bar Chart Data")
        dataSet.colors = ChartColorTemplates.joyful()

        let data = BarChartData(dataSet: dataSet)

        // Add data to the bar chart
        barChartView.data = data

        // Set X-axis labels
        let xAxis = barChartView.xAxis
        xAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
        xAxis.labelCount = labels.count
    }
    
}

class StackedBarGraphView: UIView {

    var dataSets: [[CGFloat]] = [] // Array of data sets
    var colors: [UIColor] = [] // Colors for each segment in the bar
    var xAxisLabels: [String] = [] // Labels for the x-axis
    var yAxisLabels: [String] = [] // Labels for the y-axis
    var barSpacing: CGFloat = 10.0 // Spacing between bars

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        let barWidth = (rect.width - CGFloat(dataSets.count - 1) * barSpacing) / CGFloat(dataSets.count)
        var xOffset: CGFloat = 0.0

        for dataSetIndex in 0..<dataSets.count {
            let dataSet = dataSets[dataSetIndex]
            let totalValue = dataSet.reduce(0, +)

            var yOffset: CGFloat = 0.0

            for valueIndex in 0..<dataSet.count {
                let segmentValue = dataSet[valueIndex]
                let segmentHeight = rect.height * (segmentValue / totalValue)
                let segmentColor = colors[valueIndex]

                let barRect = CGRect(x: xOffset, y: rect.height - yOffset - segmentHeight, width: barWidth, height: segmentHeight)

                context.setFillColor(segmentColor.cgColor)
                context.fill(barRect)

                yOffset += segmentHeight
            }

            xOffset += barWidth + barSpacing
        }

        // Draw x-axis labels
        for (index, label) in xAxisLabels.enumerated() {
            let xPosition = CGFloat(index) * (barWidth + barSpacing) + barWidth / 2
            let yPosition = rect.height
            let labelRect = CGRect(x: xPosition, y: yPosition, width: barWidth, height: 20.0)
            drawLabel(label, in: labelRect, context: context)
        }

        // Draw y-axis labels
        for (index, label) in yAxisLabels.enumerated() {
            let xPosition = -40.0 // Adjust as needed
            let yPosition = rect.height - CGFloat(index) * (rect.height / CGFloat(yAxisLabels.count))
            let labelRect = CGRect(x: xPosition, y: yPosition - 10.0, width: 40.0, height: 20.0)
            drawLabel(label, in: labelRect, context: context)
        }
    }

    private func drawLabel(_ text: String, in rect: CGRect, context: CGContext) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12.0),
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor.black
        ]

        let attributedText = NSAttributedString(string: text, attributes: attributes)
        attributedText.draw(in: rect)
    }
}

extension UIColor {
    
    static let primary600: UIColor = #colorLiteral(red: 0, green: 0.2862745098, blue: 0.9529411765, alpha: 1)
    static let primary500: UIColor = #colorLiteral(red: 0, green: 0.4309354424, blue: 1, alpha: 1)
    static let primary400: UIColor = #colorLiteral(red: 0.2901960784, green: 0.431372549, blue: 1, alpha: 1)
    static let primary300: UIColor = #colorLiteral(red: 0.4470588235, green: 0.5450980392, blue: 1, alpha: 1)
    
    static let secondary600: UIColor = #colorLiteral(red: 1, green: 0.6823529412, blue: 0, alpha: 1)
    static let secondary500: UIColor = #colorLiteral(red: 1, green: 0.737254902, blue: 0.01568627451, alpha: 1)
    static let secondary400: UIColor = #colorLiteral(red: 1, green: 0.7764705882, blue: 0.1490196078, alpha: 1)
    static let secondary300: UIColor = #colorLiteral(red: 1, green: 0.8196078431, blue: 0.3019607843, alpha: 1)
    
    static let grey600: UIColor = #colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)
    static let grey500: UIColor = #colorLiteral(red: 0.6196078431, green: 0.6196078431, blue: 0.6196078431, alpha: 1)
    static let grey400: UIColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
    static let grey300: UIColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
    
    static let green600: UIColor = #colorLiteral(red: 0.262745098, green: 0.6274509804, blue: 0.2745098039, alpha: 1)
    static let green500: UIColor = #colorLiteral(red: 0.2980392157, green: 0.6862745098, blue: 0.3098039216, alpha: 1)
    static let green400: UIColor = #colorLiteral(red: 0.4, green: 0.7333333333, blue: 0.4117647059, alpha: 1)
    static let green300: UIColor = #colorLiteral(red: 0.5058823529, green: 0.7803921569, blue: 0.5176470588, alpha: 1)
    
    static let red600: UIColor = #colorLiteral(red: 0.8980392157, green: 0.2235294118, blue: 0.2078431373, alpha: 1)
    static let red500: UIColor = #colorLiteral(red: 0.9568627451, green: 0.2588235294, blue: 0.2117647059, alpha: 1)
    static let red400: UIColor = #colorLiteral(red: 0.937254902, green: 0.3215686275, blue: 0.3137254902, alpha: 1)
    static let red300: UIColor = #colorLiteral(red: 0.8980392157, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
    
}
