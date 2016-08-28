//
//  ViewController.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var nskButton: NSKButton!

    private var buttonTitles = ["Default", "Right", "Top", "Bottom"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let toolBarButton1 = NSKButton(frame: CGRectMake(0, 0, 40, 40))
        toolBarButton1.nskImagePosition = .Top
        toolBarButton1.setTitle("Title1", forState: .Normal)
        toolBarButton1.setImage(UIImage(named: "image"), forState: .Normal)
        toolBarButton1.setTitleColor(UIColor(red: 0, green: CGFloat(122)/255, blue: 1, alpha: 1), forState: .Normal)
        
        let toolBarButton2 = NSKButton(frame: CGRectMake(0, 0, 40, 40))
        toolBarButton2.nskImagePosition = .Top
        toolBarButton2.setTitle("Title2", forState: .Normal)
        toolBarButton2.setImage(UIImage(named: "image"), forState: .Normal)
        toolBarButton2.setTitleColor(UIColor(red: 0, green: CGFloat(122)/255, blue: 1, alpha: 1), forState: .Normal)
        
        let buttonItem1 = UIBarButtonItem(customView: toolBarButton1)
        buttonItem1.width = 80
        
        let buttonItem2 = UIBarButtonItem(customView: toolBarButton2)
        buttonItem2.width = 80
        
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action:nil)
        
        self.setToolbarItems([flexibleItem, buttonItem1, flexibleItem, buttonItem2, flexibleItem], animated: false)
        self.navigationController?.setToolbarHidden(false, animated: false)
        
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
            
            sender.nskImagePosition = NSKButtonImagePosition(rawValue: rawValue + 1)!
        }
    
        sender.setTitle(self.buttonTitles[sender.nskImagePosition.rawValue], forState: .Normal)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)  {
    
        if segue.identifier == "ShowDecodeTestSegue" {
    
            let decodeTestViewController = segue.destinationViewController as! DecodeTestViewController
            decodeTestViewController.data = NSKeyedArchiver.archivedDataWithRootObject(self.nskButton)
        }
    }
}

