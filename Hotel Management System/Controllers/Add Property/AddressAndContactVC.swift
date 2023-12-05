//
//  AddressAndContactVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 04/11/23.
//

import UIKit
import iOSDropDown
import GoogleMaps
import GooglePlaces


class AddressAndContactVC: UIViewController,GMSMapViewDelegate {
    
    
    // MARK: - Outlet
    @IBOutlet weak var viewAddressTableView: UIView!
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var txtfieldCity: DropDown!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var googeMapTxtField: DropDown!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewReservationPhone: UIView!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewZipCode: UIView!
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var viewState: UIView!
    @IBOutlet weak var viewCountry: UIView!
    @IBOutlet weak var viewAddress: UIView!
    @IBOutlet weak var txtFieldAddress: UITextField!
    @IBOutlet weak var txtFieldCOuntry: UITextField!
    @IBOutlet weak var txtFieldState: UITextField!

    @IBOutlet weak var txtFIeldZipCode: UITextField!
    @IBOutlet weak var txtFiledPhone: UITextField!
    @IBOutlet weak var txtFieldReservationPhone: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    
    
    var placesClient: GMSPlacesClient!
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    let geocoder = GMSGeocoder()
    let searchTextField = UITextField()
    let resultsTableView = UITableView()
    var fetcher: GMSAutocompleteFetcher!
    var place: [GMSAutocompletePrediction] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        resultTableView.register(UINib(nibName: "MapTableViewCell", bundle: nil), forCellReuseIdentifier: "MapTableViewCell")
        mapView.layer.cornerRadius = 10
        txtFieldAddress.delegate = self
        placesClient = GMSPlacesClient.shared()
        fetcher = GMSAutocompleteFetcher()
        placeholderTextColor()
        //googleMap()
        txtFieldAddress.delegate = self
        placesClient = GMSPlacesClient.shared()
        txtFieldAddress.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.resultsTableView.reloadData()
        //viewAddressTableView.isHidden = true
//        resultTableView.isHidden = true
        appearViewHide()
    }
    
    func appearView() {
         self.viewAddressTableView.alpha = 0
         self.viewAddressTableView.isHidden = false

         UIView.animate(withDuration: 0.6, animations: {
             self.viewAddressTableView.alpha = 1
         }, completion: {
             finished in
             self.viewAddressTableView.isHidden = false
         })
    }
    
    func appearViewHide() {
         self.viewAddressTableView.alpha = 0
         self.viewAddressTableView.isHidden = true

         UIView.animate(withDuration: 0.6, animations: {
             self.viewAddressTableView.alpha = 1
         }, completion: {
             finished in
             self.viewAddressTableView.isHidden = true
         })
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let query = textField.text else { return }
        getAutocompleteResults(for: query)
        resultTableView.reloadData()
        
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
           reverseGeocodeCoordinate(coordinate)
       }
    func getAutocompleteResults(for query: String) {
        let placesClient = GMSPlacesClient.shared()
        placesClient.lookUpPlaceID("ChIJge5RwV7A1TsR1u4-JssV7bw") { (place, error) in
            if let error = error {
                print("Place lookup error: \(error.localizedDescription)")
            } else if let place = place {
                let coordinate = place.coordinate
                print("Place coordinate: \(coordinate.latitude), \(coordinate.longitude)")
            }
            
           // self.resultsTableView.reloadData()
        }
    }
    
    
    
    // MARK: - Additional Functions
    
    
    
    // MARK: - Function
    
    //    func addressAndContactValidation(){
    //        if txtFieldAddress.text?.isEmpty == true {
    //            txtFieldAddress.attributedPlaceholder = NSAttributedString(
    //                string: "Enter Address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
    //            )
    //            viewAddress.borderColor = UIColor.red
    //        } else {
    //            viewAddress.borderColor = UIColor.textFiledViewLine
    //        }
    //
    //        //MARK: Country Name
    //        if txtFieldCOuntry.text?.isEmpty == true {
    //            txtFieldCOuntry.attributedPlaceholder = NSAttributedString(
    //                string: "Enter Country Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //            viewCountry.borderColor = UIColor.red
    //        } else {
    //            viewCountry.borderColor = UIColor.textFiledViewLine
    //        }
    ////        MARK: State
    //        if txtFieldState.text?.isEmpty == true {
    //            txtFieldState.attributedPlaceholder = NSAttributedString(
    //                string: "Enter State Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //            viewState.borderColor = UIColor.red
    //
    //        } else {
    //            viewState.borderColor = UIColor.textFiledViewLine
    //        }
    //        //MARK: City
    //        if txtFieldCity.text?.isEmpty == true {
    //            txtFieldCity.attributedPlaceholder = NSAttributedString(
    //                string: "Enter City Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //            viewCity.borderColor = UIColor.red
    //
    //        } else {
    //            viewCity.borderColor = UIColor.textFiledViewLine
    //        }
    //        //MARK: ZipCode
    //        if txtFIeldZipCode.text?.isEmpty == true {
    //            txtFIeldZipCode.attributedPlaceholder = NSAttributedString(
    //                string: "Enter ZIP Code", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //            viewZipCode.borderColor = UIColor.red
    //
    //        } else {
    //            viewZipCode.borderColor = UIColor.textFiledViewLine
    //
    //        }
    //        if txtFIeldZipCode.text?.isEmpty == true {
    //            txtFIeldZipCode.attributedPlaceholder = NSAttributedString(
    //                string: "Enter ZIP Code", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //            viewZipCode.borderColor = UIColor.red
    //
    //        } else {
    //            viewZipCode.borderColor = UIColor.textFiledViewLine
    //
    //        }
    //        if txtFIeldZipCode.text?.isEmpty == true {
    //            txtFIeldZipCode.attributedPlaceholder = NSAttributedString(
    //                string: "Enter ZIP Code", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //            viewZipCode.borderColor = UIColor.red
    //
    //        } else {
    //            viewZipCode.borderColor = UIColor.textFiledViewLine
    //
    //        }
    //        if txtFIeldZipCode.text?.isEmpty == true {
    //            txtFIeldZipCode.attributedPlaceholder = NSAttributedString(
    //                string: "Enter ZIP Code", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    //            viewZipCode.borderColor = UIColor.red
    //
    //        } else {
    //            viewZipCode.borderColor = UIColor.textFiledViewLine
    //
    //        }
    //    }
    //    let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddressAndContactVC") as! AddressAndContactVC
    //    self.navigationController?.pushViewController(vc, animated: true)
    
    
    func googleMap() {
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749, longitude: -122.4194, zoom: 12.0)
        mapView.camera = camera
        mapView.delegate = self
        
    }
    
    // MARK: MAPView
    func updateMap(with placeID: String) {
        placesClient.lookUpPlaceID(placeID) { (place, error) in
            if let error = error {
                print("Place lookup error: \(error.localizedDescription)")
                // Handle error if needed
            } else if let coordinate = place?.coordinate {
                // Update the map with the new location
                self.updateMap(coordinate)
                //self.resultsTableView.reloadData()
            }
        }
    }
    
    func updateMap(_ coordinate: CLLocationCoordinate2D) {
        mapView.clear()
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 15.0)
        mapView.camera = camera
        let marker = GMSMarker(position: coordinate)
        marker.map = mapView
        resultTableView.reloadData()
    }
    
    func placeholderTextColor(){
        let color = UIColor.init(named: "RatePlanesTableCellTextColor")
        txtFieldAddress.attributedPlaceholder = NSAttributedString(string: txtFieldAddress.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldCOuntry.attributedPlaceholder = NSAttributedString(string: txtFieldCOuntry.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldState.attributedPlaceholder = NSAttributedString(string: txtFieldState.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtfieldCity.attributedPlaceholder = NSAttributedString(string: txtfieldCity.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFIeldZipCode.attributedPlaceholder = NSAttributedString(string: txtFIeldZipCode.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFiledPhone.attributedPlaceholder = NSAttributedString(string: txtFiledPhone.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldReservationPhone.attributedPlaceholder = NSAttributedString(string: txtFieldReservationPhone.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        txtFieldEmail.attributedPlaceholder = NSAttributedString(string: txtFieldEmail.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtFieldAddress.resignFirstResponder()
        resultTableView.reloadData()
        return true
    }
    
    func geocodeAddress(_ address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let error = error {
                print("Geocoding error: \(error.localizedDescription)")
            } else if let placemark = placemarks?.first {
                let coordinate = placemark.location?.coordinate
                self.updateMap(coordinate)
                self.resultsTableView.reloadData()
            }
        }
    }
    
    func updateMap(_ coordinate: CLLocationCoordinate2D?) {
        mapView.clear()
        guard let coordinate = coordinate else {
            return
        }
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 15.0)
        mapView.camera = camera
        let marker = GMSMarker(position: coordinate)
        marker.map = mapView
        let initialCamera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 12.0)
        mapView.camera = initialCamera
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.map = mapView
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
        mapView.addGestureRecognizer(pinchGesture)
        self.resultsTableView.reloadData()
    }
    
    // MARK: - Action
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let address = textField.text {
            geocodeAddress(address)
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtFieldAddress {
            //viewAddressTableView.isHidden = false
            appearView()
            //resultTableView.isHidden = false
            if let address = txtFieldAddress.text {
                geocodeAddress(address)
            
                self.resultsTableView.reloadData()
            }
        }
       
    }
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
         let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
         
         geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
             if let address = response?.firstResult() {
                 let lines = address.lines ?? []
                 
                 // Extracting city, address, and state from the address lines
                 var city: String?
                 var country: String?
                 var state: String?
                 
                 for line in lines {
                     if line.range(of: "locality") != nil {
                         city = line
                     } else if line.range(of: "administrative_area_level_1") != nil {
                         state = line
                     }
                 }
                 
             
                 
                 
                 // Update your UI elements with the extracted information
                 DispatchQueue.main.async {
                     self.txtfieldCity.text = country
                     self.txtFieldState.text = city
                     self.txtFieldState.text = state
                 }
             }
         }
     }

  
    
    @IBAction func btnNextPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreatePropertyStap3VC") as! CreatePropertyStap3VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handlePinchGesture(_ gestureRecognizer: UIPinchGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let scale = gestureRecognizer.scale
            var newZoom = mapView.camera.zoom / Float(scale)
            newZoom = max(min(newZoom, mapView.maxZoom), mapView.minZoom)
            mapView.animate(toZoom: newZoom)
            gestureRecognizer.scale = 1.0
        }
    }
}

extension AddressAndContactVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return place.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath) as! MapTableViewCell
        let prediction = place[indexPath.row]
        cell.lblSearchName.text = prediction.attributedFullText.string
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPrediction = place[indexPath.row]
        txtFieldAddress.text = selectedPrediction.attributedPrimaryText.string
        placesClient.lookUpPlaceID(selectedPrediction.placeID) { (place, error) in
            if let error = error {
                print("Place lookup error: \(error.localizedDescription)")
            } else if let place = place {
                let coordinate = place.coordinate
                let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 15.0)
                self.mapView.camera = camera
            }
        }
        UIView.animate(withDuration: 0.5, animations: {
                self.viewAddressTableView.alpha = 0.0
            }) { (finished) in
                if finished {
                    self.viewAddressTableView.isHidden = true
                }
            }
      
        //resultTableView.isHidden = true
//        appearViewHide()
        //viewAddressTableView.isHidden  = true
        
    }
}

extension AddressAndContactVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = (textField.text ?? "") as NSString
        let newText = currentText.replacingCharacters(in: range, with: string)
        performAutocompleteSearch(query: newText)
        return true
    }
    func performAutocompleteSearch(query: String) {
        let filter = GMSAutocompleteFilter()
        filter.type = .noFilter
        let autocompleteRequest = GMSAutocompleteSessionToken()
        placesClient.findAutocompletePredictions(
            fromQuery: query,
            filter: filter,
            sessionToken: autocompleteRequest
        ) { (results, error) in
            if let error = error {
                print("Autocomplete error: \(error.localizedDescription)")
            } else if let results = results {
                self.place = results
                self.resultsTableView.reloadData()
//                self.resultsTableView.isHidden = false
            }
        }
    }
    
}


//
//extension AddressAndContactVC: GMSAutocompleteViewControllerDelegate {
//    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
//        print("Place name: \(place.name ?? "N/A")")
//              print("Place address: \(place.formattedAddress ?? "N/A")")
//              print("Place ID: \(place.placeID ?? "N/A")")
//
//              // You can extract other details like coordinates, types, etc. from the 'place' object.
//
//              // Dismiss the autocomplete view controller
//              dismiss(animated: true, completion: nil)
//    }
//    
//    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
//        print("Error: \(error.localizedDescription)")
//    }
//
//    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    
//    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
//        reverseGeocodeCoordinate(coordinate)
//    }
//    
//    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
//        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
//        
//        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
//            if let address = response?.firstResult() {
//                let lines = address.lines ?? []
//                
//                // Extracting city, address, and state from the address lines
//                var city: String?
//                var country: String?
//                var state: String?
//                
//                for line in lines {
//                    if line.range(of: "locality") != nil {
//                        city = line
//                    } else if line.range(of: "administrative_area_level_1") != nil {
//                        state = line
//                    }
//                }
//                DispatchQueue.main.async {
//                                   self.txtfieldCity.text = city
//                                   self.txtFieldState.text = state
//                                   self.txtFieldCOuntry.text = country
//                               }
//                //    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
//                //        // Get full address details
//                //        let addressComponents = place.addressComponents
//                //
//                //        // Process address components
//                //        for component in addressComponents! {
//                //            if let value = component.name {
//                //
//                //
//                //                    txtFieldCOuntry.text = value
//                //
//                //                    txtFieldState.text = value
//                //
//                //                    txtfieldCity.text = value
//                //
//                //
//                //                }
//                //            }
//                //        }
//                //
//                ////        dismiss(animated: true, completion: nil)
//               
//            }
//            
//        }
//    }
//}
// 
