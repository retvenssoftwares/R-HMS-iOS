//
//  DiscountRatePlaneVC.swift
//  Hotel Management System
//
//  Created by Smart Kamina on 25/11/23.
//

import UIKit


class DiscountRatePlaneVC: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var discountRateTableView: UITableView!
    @IBOutlet weak var discountRatePlaneCOllectionView: UICollectionView!
    
    var arrDate = ["12 Mar, 2023", "13 Mar, 2023", "14 Mar, 2023", "15 Mar, 2023", "17 Mar, 2023", "18 Mar, 2023"]
    //var dataSource: [Int] = [1, 2, 3]

    private let sectionTitles = ["First section", "Second section", "Third section"]
    private var sectionIsExpanded = [true, true, true]
    private let numberOfActualRowsForSection = 4
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        discountRateTableView.register(UINib(nibName: "DiscountTableViewCell", bundle: nil), forCellReuseIdentifier: "DiscountTableViewCell")
        discountRatePlaneCOllectionView.register(UINib(nibName: "DiscountCollectionCell", bundle: .main), forCellWithReuseIdentifier: "DiscountCollectionCell")
        self.discountRatePlaneCOllectionView.register(UINib(nibName: "DiscountCOllectionHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DiscountCOllectionHeaderCell")
        discountRatePlaneCOllectionView.collectionViewLayout = createCompositionalLayout()
        
        DispatchQueue.main.async {
            self.discountRatePlaneCOllectionView.reloadData()
        }
        
    }
    func AddItem(at indexPath: IndexPath) {
        arrDate.append(arrDate[indexPath.row])
        discountRatePlaneCOllectionView.insertItems(at: [indexPath])
        discountRatePlaneCOllectionView.reloadItems(at: [indexPath])
        DispatchQueue.main.async {
        self.discountRatePlaneCOllectionView.reloadData()
        }
    }
    
    func deleteItem(at indexPath: IndexPath) {
        if arrDate.count > 0 {
            arrDate.remove(at: indexPath.row)
        }
        DispatchQueue.main.async {
            self.discountRatePlaneCOllectionView.reloadData()
        }
    }


}
// MARK: - Extension

extension DiscountRatePlaneVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return self.generateChatModule()
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        layout.configuration = config
        return layout
    }
    func generateChatModule() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalHeight(1.0))
        
        
        let fullPhotoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(40))
        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 0,leading: 0,bottom: 5,trailing: 0)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: fullPhotoItem,
            count: 3
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [createSectionHeader()]
        return section
    }
    
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(26))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DiscountCOllectionHeaderCell", for: indexPath) as! DiscountCOllectionHeaderCell
            reusableview.addDataClicked = { [weak self] in
                self?.AddItem(at: indexPath)
            }
            return reusableview
            
            
        default:
            fatalError("Unexpected element kind")
            //return UICollectionReusableView()
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscountCollectionCell", for: indexPath) as! DiscountCollectionCell
        cell.lblDate.text = arrDate[indexPath.row]
        cell.deleteBtnClicked = {[weak self] in
            self?.deleteItem(at: indexPath)
        }
        return cell
    }
}


extension DiscountRatePlaneVC:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
            return sectionTitles.count

        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return sectionIsExpanded[section] ? (1+numberOfActualRowsForSection) : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DiscountHeaderCell", for: indexPath) as! DiscountHeaderCell
          
            
            if sectionIsExpanded[indexPath.section] {
                cell.setExpanded()
            } else {
                cell.setCollapsed()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DiscountTableViewCell", for: indexPath) as! DiscountTableViewCell
           
            //cell.textLabel?.text = "Section: \(indexPath.section); row \(indexPath.row)"
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Expand/hide the section if tapped its header
        if indexPath.row == 0 {
            sectionIsExpanded[indexPath.section] = !sectionIsExpanded[indexPath.section]
            tableView.reloadSections([indexPath.section], with: .automatic)
        }
    }
    
}
