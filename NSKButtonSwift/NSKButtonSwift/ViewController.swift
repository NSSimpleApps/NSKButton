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

    fileprivate var buttonTitles = ["Default", "Right", "Top", "Bottom"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let toolBarButton1 = NSKButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        toolBarButton1.nskImagePosition = .top
        toolBarButton1.setTitle("Title1", for: UIControlState())
        toolBarButton1.setImage(UIImage(named: "image"), for: UIControlState())
        toolBarButton1.setTitleColor(UIColor(red: 0, green: CGFloat(122)/255, blue: 1, alpha: 1), for: UIControlState())
        
        let toolBarButton2 = NSKButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        toolBarButton2.nskImagePosition = .top
        toolBarButton2.setTitle("Title2", for: UIControlState())
        toolBarButton2.setImage(UIImage(named: "image"), for: UIControlState())
        toolBarButton2.setTitleColor(UIColor(red: 0, green: CGFloat(122)/255, blue: 1, alpha: 1), for: UIControlState())
        
        let buttonItem1 = UIBarButtonItem(customView: toolBarButton1)
        buttonItem1.width = 80
        
        let buttonItem2 = UIBarButtonItem(customView: toolBarButton2)
        buttonItem2.width = 80
        
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action:nil)
        
        self.setToolbarItems([flexibleItem, buttonItem1, flexibleItem, buttonItem2, flexibleItem], animated: false)
        self.navigationController?.setToolbarHidden(false, animated: false)
        
        self.nskButton.layer.borderColor =
            UIColor(red: 0, green: CGFloat(122)/255, blue: 1, alpha: 1).cgColor
        self.nskButton.layer.borderWidth = 1
        self.nskButton.setTitle(self.buttonTitles.first, for: UIControlState())
    }
    
    @IBAction func changeImagePosition(_ sender: NSKButton) {
    
        if (sender.nskImagePosition == .bottom) {
    
            sender.nskImagePosition = .default
        
        } else {
            
            let rawValue = sender.nskImagePosition.rawValue
            
            sender.nskImagePosition = NSKButtonImagePosition(rawValue: rawValue + 1)!
        }
    
        sender.setTitle(self.buttonTitles[sender.nskImagePosition.rawValue], for: UIControlState())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
    
        if segue.identifier == "ShowDecodeTestSegue" {
    
            let decodeTestViewController = segue.destination as! DecodeTestViewController
            decodeTestViewController.data = NSKeyedArchiver.archivedData(withRootObject: self.nskButton)
        }
    }
}

