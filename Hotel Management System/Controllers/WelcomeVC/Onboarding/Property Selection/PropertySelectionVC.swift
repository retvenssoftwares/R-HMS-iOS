//
//  PropertySelectionVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 05/11/23.
//

import UIKit

class PropertySelectionVC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var viewPropertyChain: UIView!
    @IBOutlet weak var viewSingleProperty: UIView!
    var propertyTypeSOC: String = "Unknown"
    @IBOutlet weak var propertyChainBtn: UIButton!
    @IBOutlet weak var singlePropertyBtn: UIButton!
    var isSideViewOpen: Bool = false
    let apiUrl = URL(string: "https://api.hotelratna.com/api/userEdit")!
    var singleProperty: String = "Single"
    var multipleProperty: String = "Multiple"
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.isHidden = true
        hideKeyboardWhenTappedAround()
        //sideMenuTableView.register(UINib(nibName: "SideMenuTableCell", bundle: nil), forCellReuseIdentifier: "SideMenuTableCell")
        
        navigationController?.navigationBar.isHidden = false
        viewPropertyChain.layer.cornerRadius = 10
        viewPropertyChain.layer.borderWidth = 1
        viewPropertyChain.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewSingleProperty.layer.cornerRadius = 10
        viewSingleProperty.layer.borderWidth = 1
        viewSingleProperty.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
    }
    
    func clickBtnResponse(){
        let parameters = [["key": "userId","value": "value","type": "text"],["key": "propertyName","value": "aHotel","type":"text"],["key": "propertyType","value": "Hotel","type": "text"],["key":"propertyAddress1","value": "abc","type": "text"],["key": "postCode","value": "401204","type": "text"],["key": "country","value":"India","type": "text"],["key": "state","value": "UP","type": "text"],["key": "city","value": "Amroha","type": "text"],["key": "starCatagory","value": "5star","type": "text"],["key": "ratePercent","value": "5","type": "text"],["key": "baseCurrency","value": "INR","type": "text"],["key": "websiteUrl","value": "www.rhotel.com","type": "text"],["key": "roomsInProperty","value": "30","type": "text"],["key": "textName","value": "gst","type": "text"],["key": "registrationNumber","value": "14251","type": "text"],["key": "propertyTypeSOC","value": "Single","type": "text"]] as [[String: Any]]
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        var error: Error? = nil
        for param in parameters {
            if param["disabled"] != nil { continue }
            let paramName = param["key"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if param["contentType"] != nil {
                body += "\r\nContent-Type: \(param["contentType"] as! String)"
            }
            let paramType = param["type"] as! String
            if paramType == "text" {
                let paramValue = param["value"] as! String
                body += "\r\n\r\n\(paramValue)\r\n"
            } else {
                let paramSrc = param["src"] as! String
                let fileData = try! NSData(contentsOfFile: paramSrc, options: []) as Data
                let fileContent = String(data: fileData, encoding: .utf8)!
                body += "; filename=\"\(paramSrc)\"\r\n"
                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
            }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/userEdit")!,timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "PATCH"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
        
    }
    
    // MARK: - Action
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    @IBAction func propertyChainBtnPressed(_ sender: UIButton) {
        if propertyChainBtn.isEnabled == true {
            viewPropertyChain.layer.borderColor = UIColor.green.cgColor
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingPropertyChain1VC") as! OnboardingPropertyChain1VC
            multipleProperty = "Multiple"
            vc.multipleProperty = multipleProperty
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            viewPropertyChain.layer.borderColor = UIColor.textFiledViewLine.cgColor
        }
    }
    
   
    
    @IBAction func singlePropertyBtnPressed(_ sender: UIButton) {
        //updatePropertyTypeSOC(for: "single")
        if singlePropertyBtn.isEnabled == true {
            viewSingleProperty.layer.borderColor = UIColor.green.cgColor
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SingleProperty1VC") as! SingleProperty1VC
            vc.property = singleProperty
            //clickBtnResponse()
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            viewSingleProperty.layer.borderColor = UIColor.textFiledViewLine.cgColor
        }
    }
}

extension PropertySelectionVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableCell", for: indexPath) as! SideMenuTableCell
        cell.setDataSideTable(no: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChargesPlanes1VC") as! ChargesPlanes1VC
            self.navigationController?.pushViewController(vc, animated:true)
        }
        else if indexPath.row == 1 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RatesAndInventoryVC") as! RatesAndInventoryVC
            self.navigationController?.pushViewController(vc, animated:true)
        }
        else if indexPath.row == 2 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuickReservationsVC") as! QuickReservationsVC
            self.navigationController?.pushViewController(vc, animated:true)
        }
        else if indexPath.row == 3 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChannelsVC") as! ChannelsVC
            self.navigationController?.pushViewController(vc, animated:true)
        }
        else if indexPath.row == 4 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewAllPropertyVC") as! ViewAllPropertyVC
            self.navigationController?.pushViewController(vc, animated:true)
        }
        else if indexPath.row == 5 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReservationsVC") as! ReservationsVC
            self.navigationController?.pushViewController(vc, animated:true)
        }
        else if indexPath.row == 6 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateRatePlaneVC") as! CreateRatePlaneVC
            self.navigationController?.pushViewController(vc, animated:true)
        }
        else if indexPath.row == 7 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogsVC") as! LogsVC
            self.navigationController?.pushViewController(vc, animated:true)
        }
    }
}
