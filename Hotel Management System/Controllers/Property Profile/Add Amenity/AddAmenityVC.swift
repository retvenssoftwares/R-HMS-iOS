//
//  AddAmenityVC.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 03/11/23.
//

import UIKit



class AddAmenityVC: UIViewController {
    
    
    // MARK: - Outlet
    @IBOutlet weak var addMaenityCollectionCell: UICollectionView!
    @IBOutlet weak var lblSelectedAmenity: UILabel!
    @IBOutlet weak var searchBarAddAmenity: UISearchBar!
    
    var userdefaults = UserDefaults.standard
    var amenities: [AmenityData] = []
    //var amenity: AmenityDataModel?
    var change: [AnyObject] = []
    var selectedIndices = [Int]()
    var counter: Int = 0
    var previousVC:NewPropertyProfileVC?
    var selectedIndexPaths = Set<IndexPath>()
    var arrImgAminity = ["AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg",]
    var arrlblAminity = ["Child-friendly1","Child-friendly2","Child-friendly3","Child-friendly4","Child-friendly5","Child-friendly6","Child-friendly7","Child-friendly8","Child-friendly9","Child-friendly10",]
    var amenityArray = [[AnyObject]]()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        amenities = extractAmenities()
        addMaenityCollectionCell.reloadData()
        addMaenityCollectionCell.register(UINib(nibName: "AddAmneityCollectionCell", bundle: .main), forCellWithReuseIdentifier: "AddAmneityCollectionCell")
        //addAmenityTableCell.register(UINib(nibName: "AddAmenityCell", bundle: nil), forCellReuseIdentifier: "AddAmenityCell")
        addMaenityCollectionCell.collectionViewLayout = createCompositionalLayout()
        selectedIndices.removeAll()
        addMaenityCollectionCell.reloadData()
        //getAmenity()
        //Api()
        getAmenity()
        
        
        
    }
    
    @IBAction func btnNavigationBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNavigationDonePressed(_ sender: UIButton) {
        //addAmenityTableCell.reloadData()
        selectedIndices.removeAll()
        previousVC?.onUserAction(data: arrlblAminity)
        self.navigationController?.popViewController(animated: true)
        
    }
    func updateSelectedIndicesLabel() {
        lblSelectedAmenity.text = "\(counter) Selected Amenity"
    }
    
    
    
    
    func getAmenity() {
        
        let url = NSURL(string: "https://api.hotelratna.com/api/getAmenity?propertyId=")!
        let request = NSMutableURLRequest(url: url as URL)
        URLSession.shared.dataTask(with: request as URLRequest) { (data:Data?, response:URLResponse?, error:Error?) in
            if error != nil {
                print("Error: \(String(describing: error))")
            }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                
                // secured way to declare new var that will store json data
                guard let parsedJSON = json else {
                    print("Error while parsing")
                    return
                }
                
                
                guard let actorsJSON = parsedJSON["data"] else {
                    print("Error while actoring")
                    return
                }
                
                print(parsedJSON)
                DispatchQueue.main.async {
                    self.amenityArray = actorsJSON as? [[AnyObject]] ?? [[]]
                    self.addMaenityCollectionCell.reloadData()
                    for amenity in self.amenityArray {
                        print(amenity)
                    }
                }
                
            } catch {
                print("Caught an error: \(error)")
            }
        }.resume()
    }
    
//    func extractAmenities() -> [AmenityData] {
//            var extractedAmenities: [AmenityData] = []
//
//            for innerArray in amenityArray {
//                if let amenityId = innerArray.first as? String,
//                   let amenityName = innerArray[1] as? String {
//                    let amenity = AmenityData(amenityId: amenityId, amenityName: amenityName)
//                    extractedAmenities.append(amenity)
//                }
//            }
//
//            return extractedAmenities
//        }
    
    func extractAmenities() -> [AmenityData] {
        var extractedAmenities: [AmenityData] = []

        for innerArray in amenityArray {
            // Check if the innerArray has at least two elements before accessing them
            if innerArray.count >= 2,
               let amenityID = innerArray.first as? String,
               let amenityName = innerArray[1] as? String {
                let amenity = AmenityData(amenityId: amenityID, amenityName: amenityName)
                extractedAmenities.append(amenity)
            }
        }

        return extractedAmenities
    }

    
}
// MARK: - Extension CollectionVIew



extension AddAmenityVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return self.generateChatModule(no: sectionIndex)
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        layout.configuration = config
        return layout
    }
    func generateChatModule(no: Int) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .estimated(20)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20)), subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,leading: 0,bottom: 5,trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return amenities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddAmneityCollectionCell", for: indexPath) as! AddAmneityCollectionCell
        var names: [String] = []
        if selectedIndexPaths.contains(indexPath) {
            let selectedRow = indexPath.row
            print(selectedIndices.count)
            if !selectedIndices.contains(selectedRow) {
                counter = selectedIndices.count
                print(counter)
                cell.viewBg.backgroundColor = UIColor.init(named: "SelectAmenity")
                cell.viewBg.layer.borderWidth = 2
                let color = UIColor.init(named: "ViewColor")
                cell.viewBg.layer.borderColor = color?.cgColor
            }
            
            else {
                cell.viewBg.backgroundColor = UIColor.white
                cell.viewBg.layer.borderWidth = 0
                cell.viewBg.layer.borderColor = UIColor.white.cgColor
            }
            let amenity = amenities[indexPath.item]
            //cell.lblAmenity.text = amenity.amenityId
            cell.lblAmenity.text = amenity.amenityName
            print(amenity.amenityId, amenity.amenityName)
        
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddAmneityCollectionCell", for: indexPath) as! AddAmneityCollectionCell
        
        selectedIndexPaths.insert(indexPath)
        collectionView.reloadItems(at: [indexPath])
        let selectedRow = indexPath.row
        print(selectedIndices.count)
        if !selectedIndices.contains(selectedRow) {
            print(selectedIndices.contains(selectedRow))
            selectedIndices.append(selectedRow)
            print(selectedIndices, selectedRow)
            counter = selectedIndices.count
            print(counter)
        } else {
            // Deselect the row
            if let indexToRemove = selectedIndices.firstIndex(of: selectedRow) {
                selectedIndices.remove(at: indexToRemove)
            }
        }
        updateSelectedIndicesLabel()
    }
}


