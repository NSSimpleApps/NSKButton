//
//  DecodeTestViewController.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 25.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

class DecodeTestViewController: UIViewController {
    
    var data: NSData!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.title = "Decode NSKButton"
        
        if let button = NSKeyedUnarchiver.unarchiveObjectWithData(self.data) as? NSKButton {
            
            button.center = self.view.center
            
            self.view.addSubview(button)
            
            let horizontalConstraint = button.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            let vertivalConstraint = button.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
            
            NSLayoutConstraint.activateConstraints([horizontalConstraint, vertivalConstraint])
        }
    }
}
