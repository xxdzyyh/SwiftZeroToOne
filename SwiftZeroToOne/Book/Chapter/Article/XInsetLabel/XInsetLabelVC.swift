//
//  XInsetLabelVC.swift
//  SwiftZeroToOne
//
//  Created by sckj on 2020/9/27.
//

import UIKit

class XInsetLabelVC: UIViewController {

    @IBOutlet weak var insetLabel: XInsetLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.insetLabel.insets = UIEdgeInsets(top: 8, left: 18, bottom: 28, right: 38)
        self.insetLabel.backgroundColor = .orange
    }
}
