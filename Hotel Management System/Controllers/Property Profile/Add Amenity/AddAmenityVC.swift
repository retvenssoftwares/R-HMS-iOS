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
    @IBOutlet weak var addAmenityTableCell: UITableView!
    var change: [AnyObject] = []
    var selectedIndices = [Int]()
    var counter: Int = 0
    var previousVC:NewPropertyProfileVC?
    var selectedIndexPaths = Set<IndexPath>()
    var arrImgAminity = ["AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg","AmenityImg",]
    var arrlblAminity = ["Child-friendly1","Child-friendly2","Child-friendly3","Child-friendly4","Child-friendly5","Child-friendly6","Child-friendly7","Child-friendly8","Child-friendly9","Child-friendly10",]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addMaenityCollectionCell.register(UINib(nibName: "AddAmneityCollectionCell", bundle: .main), forCellWithReuseIdentifier: "AddAmneityCollectionCell")
        //addAmenityTableCell.register(UINib(nibName: "AddAmenityCell", bundle: nil), forCellReuseIdentifier: "AddAmenityCell")
        addMaenityCollectionCell.collectionViewLayout = createCompositionalLayout()
        selectedIndices.removeAll()
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
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(20)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20)), subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,leading: 0,bottom: 5,trailing: 0)
            let section = NSCollectionLayoutSection(group: group)
            return section
        }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrlblAminity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddAmneityCollectionCell", for: indexPath) as! AddAmneityCollectionCell
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
        }
        cell.lblAmenity.text = arrlblAminity[indexPath.row]
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


