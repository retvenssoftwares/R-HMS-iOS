//
//  ViewController.swift
//  Test
//
//  Created by mayur bobade on 06/12/23.
//

import UIKit

struct AmenityDataModel: Codable {
    let data: [AmenityData]
    let statuscode: Int
}

struct AmenityData: Codable {
    let amenityId: String
    let amenityName: String
    let amenityType: String
    let amenityIconLink: String
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var testTableView: UITableViewCell!
    
    
    var amenityDataArray: [AmenityData] = []
    var amenity: AmenityDataModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TestTableViewCell")
    }

    
    func Api(){
        let urlString = "https://api.hotelratna.com/api/getAmenity"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            // Handle the invalid URL accordingly
            return
        }
        
        // Create URLRequest with the provided URL and auth code
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)

        request.addValue("27fb4373e23a586782ee65fa91773c0468bc9f0a0578b819be3826d29fb75b1165e5eaf5ac479414b6d3bcda6bbea5c52f870b8750cf0524f416b2010717a679", forHTTPHeaderField: "authcode")
        request.httpMethod = "GET"
        
        // Perform the URLSession data task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                // Handle the error accordingly
                return
            }
            
            guard let data = data else {
                print("No data received")
                // Handle the absence of data accordingly
                return
            }
            
            do {
                // Decode the received data into AmenityDataModel
                let amenityDataModel = try JSONDecoder().decode(AmenityDataModel.self, from: data)
                
                // Check the status code
                if amenityDataModel.statuscode == 200 {
                    
                    // Access your data as needed
                   
                    let amenityDataArray = amenityDataModel.data
                   
                    for amenityData in amenityDataArray {
                        print("Amenity ID: \(amenityData.amenityId)")
                        print("Amenity Name: \(amenityData.amenityName)")
                        print("Amenity Type: \(amenityData.amenityType)")
                        print("Amenity Icon Link: \(amenityData.amenityIconLink)")
                        print("-------------")
                        DispatchQueue.main.async {
                            self.testTableView.reloadData()
                        }
                    }
                } else {
                    print("Unexpected status code: \(amenityDataModel.statuscode)")
                    // Handle the unexpected status code accordingly
                }
            } catch {
                print("Error decoding JSON: \(error)")
                // Handle decoding error accordingly
            }
        }
        
        // Resume the task to initiate the request
        task.resume()
    }
    

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let amenityData = amenityDataArray[indexPath.row]
                cell.lblNAme?.text = amenityData.amenityName
        return cell
    }
    
    
}
