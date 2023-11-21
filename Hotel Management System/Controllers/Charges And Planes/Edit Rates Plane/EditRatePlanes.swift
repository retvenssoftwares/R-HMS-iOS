//
//  EditRatePlanes.swift
//  Hotel Management System
//
//  Created by mayur bobade on 14/11/23.
//

import UIKit

class EditRatePlanes: UIViewController {

    @IBOutlet weak var editRateAndPlanesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        editRateAndPlanesTableView.register(UINib(nibName: "EditRatePlaneTableCell", bundle: nil), forCellReuseIdentifier: "EditRatePlaneTableCell")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension EditRatePlanes:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditRatePlaneTableCell", for: indexPath) as! EditRatePlaneTableCell
        return cell
    }
    
    
}
