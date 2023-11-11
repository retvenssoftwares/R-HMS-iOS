//
//  AddressAndContactVC.swift
//  Hotel Management System
//
//  Created by mayur bobade on 04/11/23.
//

import UIKit
import GoogleMaps
import GooglePlaces

class AddressAndContactVC: UIViewController {
    
    
    
    private var tableView: UITableView!
    var tableData = [GMSAutocompletePrediction]()
    var placesClient: GMSPlacesClient!
    var fetcher: GMSAutocompleteFetcher?
    // MARK: - Outlet
    @IBOutlet weak var googleMapView: UIView!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var viewAddressLine1: UIView!
    @IBOutlet weak var txtFieldAddressLine1: UITextField!
    @IBOutlet weak var viewAddressLine2: UIView!
    @IBOutlet weak var txtFieldAddressLine2: UITextField!
    @IBOutlet weak var viewCIty: UIView!
    @IBOutlet weak var txtFieldCity: UITextField!
    @IBOutlet weak var viewZipCode: UIView!
    @IBOutlet weak var txtFieldZipCode: UITextField!
    @IBOutlet weak var viewCountryName: UIView!
    @IBOutlet weak var txtFielldCountry: UITextField!
    @IBOutlet weak var viewStateName: UIView!
    @IBOutlet weak var txtFieldState: UITextField!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var txtFieldPhone: UITextField!
    @IBOutlet weak var viewReservationPhone: UIView!
    @IBOutlet weak var txtFieldReservationPhone: UITextField!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var viewWebsite: UIView!
    @IBOutlet weak var txtFieldWebsite: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //txtFieldCity.delegate = self
        self.googleMap()
        self.performPlaceSearch()
        btnContinue.layer.cornerRadius = 5
        self.textFieldBorderLine()
        self.textFieldPlaceHolderTextChange()
        placesClient = GMSPlacesClient.shared()
        
        let filter = GMSAutocompleteFilter()
        filter.type = .establishment
        let nsBoundsCorner = CLLocationCoordinate2D(latitude: 20.5937, longitude: 78.9629)
        let bounds = GMSCoordinateBounds(coordinate: nsBoundsCorner, coordinate: nsBoundsCorner)
        
        fetcher  = GMSAutocompleteFetcher(filter: filter)
        fetcher?.delegate = self
        
        txtFieldCity?.addTarget(self, action: #selector(textFieldDidChange(textField:)),for: .editingChanged)
        
    }
    
    
    // MARK: - Function
    func googleMap() {
        let camera = GMSCameraPosition.camera(withLatitude: 22.7196, longitude: 75.8577, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.googleMapView.frame, camera: camera)
        self.googleMapView.addSubview(mapView)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 22.7196, longitude: 75.8577)
        marker.title = "Indore"
        marker.snippet = "India"
        marker.map = mapView
        
    }
    @objc func textFieldDidChange(textField: UITextField) {
        fetcher?.sourceTextHasChanged(txtFieldCity.text!)
    }
    func performPlaceSearch() {
        guard let searchText = txtFieldCity.text, !searchText.isEmpty else {
            // Handle the case where the search text is empty
            return
        }
        
        let placesClient = GMSPlacesClient.shared()
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        
        placesClient.findAutocompletePredictions(fromQuery: searchText, filter: filter, sessionToken: nil) { (results, error) in
            if let error = error {
                print("Autocomplete error: \(error.localizedDescription)")
                return
            }
            
            // Process the autocomplete results
            if let predictions = results {
                // Display the predictions or handle them as needed
                for prediction in predictions {
                    print("Place ID: \(prediction.placeID), Place description: \(prediction.attributedFullText.string)")
                }
            }
        }
    }
    func textFieldBorderLine(){
        viewAddressLine1.layer.borderWidth = 1
        viewAddressLine1.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewAddressLine1.layer.cornerRadius = 10
        
        viewAddressLine2.layer.borderWidth = 1
        viewAddressLine2.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewAddressLine2.layer.cornerRadius = 10
        
        viewCIty.layer.borderWidth = 1
        viewCIty.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewCIty.layer.cornerRadius = 10
        
        viewZipCode.layer.borderWidth = 1
        viewZipCode.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewZipCode.layer.cornerRadius = 10
        
        viewCountryName.layer.borderWidth = 1
        viewCountryName.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewCountryName.layer.cornerRadius = 10
        
        viewCountryName.layer.borderWidth = 1
        viewCountryName.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewCountryName.layer.cornerRadius = 10
        
        viewStateName.layer.borderWidth = 1
        viewStateName.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewStateName.layer.cornerRadius = 10
        
        viewPhone.layer.borderWidth = 1
        viewPhone.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewPhone.layer.cornerRadius = 10
        
        viewReservationPhone.layer.borderWidth = 1
        viewReservationPhone.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewReservationPhone.layer.cornerRadius = 10
        
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewEmail.layer.cornerRadius = 10
        
        viewWebsite.layer.borderWidth = 1
        viewWebsite.layer.borderColor = UIColor.init(named: "TextFiledViewLine")?.cgColor
        viewWebsite.layer.cornerRadius = 10
    }
    
    
    func textFieldPlaceHolderTextChange(){
        let color = UIColor.init(named: "TextColor")
        txtFieldAddressLine1.attributedPlaceholder = NSAttributedString(string: txtFieldAddressLine1.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldAddressLine2.attributedPlaceholder = NSAttributedString(string: txtFieldAddressLine2.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldCity.attributedPlaceholder = NSAttributedString(string: txtFieldCity.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldZipCode.attributedPlaceholder = NSAttributedString(string: txtFieldZipCode.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFielldCountry.attributedPlaceholder = NSAttributedString(string: txtFielldCountry.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldState.attributedPlaceholder = NSAttributedString(string: txtFieldState.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldPhone.attributedPlaceholder = NSAttributedString(string: txtFieldPhone.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldReservationPhone.attributedPlaceholder = NSAttributedString(string: txtFieldReservationPhone.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldEmail.attributedPlaceholder = NSAttributedString(string: txtFieldEmail.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
        
        txtFieldWebsite.attributedPlaceholder = NSAttributedString(string: txtFieldWebsite.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        txtFieldCity.text = place.formattedAddress
        print(txtFieldCity.text)
        dismiss(animated: true, completion: nil)
        let camera = GMSCameraPosition.camera(withLatitude: 22.7196, longitude: 75.8577, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.googleMapView.frame, camera: camera)
        mapView.camera = GMSCameraPosition(target: place.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        let marker = GMSMarker(position: place.coordinate)
        marker.title = place.name
        marker.map = mapView
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Action
    @IBAction func addPropertyBtnPressed(_ sender: UIButton) {
    }
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
    }
}

extension AddressAndContactVC: GMSAutocompleteViewControllerDelegate, GMSAutocompleteFetcherDelegate  {
    
    func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
       
        for prediction in predictions{
           // tableData.append(prediction)
            print(prediction)
        }
       
    }
    
    func didFailAutocompleteWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    func getLatLongFromAutocompletePrediction(prediction:GMSAutocompletePrediction){
        
        let placeClient = GMSPlacesClient()
        
        placeClient.lookUpPlaceID(prediction.placeID) { (place, error) -> Void in
            if let error = error {
                //show error
                return
            }
            
            if let place = place {
                place.coordinate.longitude //longitude
                place.coordinate.latitude //latitude
            } else {
                //show error
            }
        }
    }
}
