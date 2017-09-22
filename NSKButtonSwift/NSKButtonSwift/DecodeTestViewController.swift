//
//  DecodeTestViewController.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 25.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

class DecodeTestViewController: UIViewController {
    
    var data: Data!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.title = "Decode NSKButton"
        
        if let button = NSKeyedUnarchiver.unarchiveObject(with: self.data) as? NSKButton {
            
            button.center = self.view.center
            
            self.view.addSubview(button)
            
            NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        }
    }
}
