//
//  WelcomeViewController.swift
//  Retvent
//
//  Created by Mayur Bobade on 01/11/23.
//

import UIKit
import PhotosUI
import FittedSheets
import Alamofire
class WelcomeViewController: UIViewController {
    
    // MARK: - Oulet
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var btnNext: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    // MARK: - Action
    
//    func getAmenityData() {
//        var request = URLRequest(url: URL(string: "https://api.hotelratna.com/api/getAmenity?propertyId=")!,timeoutInterval: Double.infinity)
//        request.httpMethod = "GET"
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            do {
//                if let postData = data {
//                    let decodedData = try JSONDecoder().decode(AmenityCollection.self, from: postData)
//                    DispatchQueue.main.async {
//                        self.arryData = decodedData.amenityData
//                    }
//                } else {
//                    print("No data")
//                }
//            } catch {
//                print(error)
//            }
//            
//            //          guard let data = data else {
//            //
//            //            print(String(describing: error))
//            //            return
//            //          }
//            
//            // print(String(data: data, encoding: .utf8)!)
//        }
//        
//        task.resume()
//        
//    }
    
    //    func getAmenityData() {
    //        var request = URLRequest(url: URL(string: "")!,timeoutInterval: Double.infinity)
    //        request.httpMethod = "GET"
    //
    //        let task = URLSession.shared.dataTask(with: request) { data, response, error in
    //
    //          guard let data = data else {
    //            print(String(describing: error))
    //            return
    //          }
    //          print(String(data: data, encoding: .utf8)!)
    //        }
    //
    //
    //
    //        task.resume()
    //
    //    }
    
    //    func amenityDataCall() {
    //        let apiUrl = APIManager.UsersAuth.getAmenity
    //
    //        AF.request(apiUrl).responseDecodable(of: ApiResponse.self) { response in
    //            switch response.result {
    //            case .success(let apiResponse):
    //                // Access your data array here
    //                let amenityDataArray = apiResponse.data
    //                print("Data: \(amenityDataArray)")
    //
    //                // Access status code
    //                let statusCode = apiResponse.statusCode
    //                print("Status Code: \(statusCode)")
    //
    //            case .failure(let error):
    //                print("Error: \(error.localizedDescription)")
    //            }
    //        }
    //    }
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        //getAmenityData()
       
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AuthenticationVC") as! AuthenticationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


