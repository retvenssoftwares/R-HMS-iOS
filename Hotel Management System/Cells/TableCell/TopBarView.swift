//
//  TopBarView.swift
//  Hotel Management System
//
//  Created by mayur bobade on 04/11/23.
//

import UIKit
import UIKit

class TopBarView: UIView {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var menuLbl: UILabel!
    @IBOutlet weak var menuBtn: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupXib()
    }
    @IBAction func menuBtn(_ sender: Any) {
        setupXib()
    }
    
    func setupXib() {
        self.containerView = Bundle.main.loadNibNamed("TopBarView", owner: self, options: nil)![0] as! UIView
        self.containerView.frame = bounds
        self.containerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        addSubview(containerView)
    }
}
