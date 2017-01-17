//
//  ViewController.swift
//  NSKButtonSwiftTV
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

class TVViewController: UIViewController {
    
    @IBOutlet weak var nskButton: NSKButton!
    
    private var buttonTitles = ["Default", "Right", "Top", "Bottom"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.nskButton.layer.borderColor =
            UIColor(red: 0, green: CGFloat(122)/255, blue: 1, alpha: 1).CGColor
        self.nskButton.layer.borderWidth = 1
        
        self.nskButton.setTitle(self.buttonTitles.first, forState: .Normal)
    }
    
    @IBAction func changeImagePosition(sender: NSKButton) {
        
        if (sender.nskImagePosition == .Bottom) {
            
            sender.nskImagePosition = .Default
            
        } else {
            
            let rawValue = sender.nskImagePosition.rawValue
            
            sender.nskImagePosition = NSKImagePosition(rawValue: rawValue + 1)!
        }
        
        sender.setTitle(self.buttonTitles[sender.nskImagePosition.rawValue], forState: .Normal)
    }
}

