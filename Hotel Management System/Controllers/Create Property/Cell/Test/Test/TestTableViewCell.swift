//
//  TestTableViewCell.swift
//  Test
//
//  Created by mayur bobade on 06/12/23.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNAme: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
