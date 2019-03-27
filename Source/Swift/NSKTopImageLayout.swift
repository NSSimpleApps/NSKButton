//
//  NSKTopImageLayout.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 24.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit


internal class NSKTopImageLayout: NSKVerticalImageLayout {
    
    override static func titleRect(forContentRect contentRect: CGRect,
                                  defaultTitleRect: CGRect,
                                  imageRect: CGRect,
                                  titleEdgeInsets: UIEdgeInsets) -> CGRect {
        
        let p =
            CGPoint(x: contentRect.midX - defaultTitleRect.width/2 + titleEdgeInsets.left - titleEdgeInsets.right,
                    y: contentRect.maxY - defaultTitleRect.height + titleEdgeInsets.top - titleEdgeInsets.bottom)
        
        return CGRect(origin: p, size: defaultTitleRect.size)
    }
    
    override static func imageRect(forContentRect contentRect: CGRect,
                                  defaultImageRect: CGRect,
                                  titleRect: CGRect,
                                  imageEdgeInsets: UIEdgeInsets) -> CGRect {
        
        return CGRect(x: contentRect.midX - defaultImageRect.width/2 + imageEdgeInsets.left - imageEdgeInsets.right,
                      y: contentRect.minY + imageEdgeInsets.top - imageEdgeInsets.bottom,
                      width: defaultImageRect.width,
                      height: defaultImageRect.height)
    }
}
