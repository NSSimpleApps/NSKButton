//
//  NSKTopImageLayout.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 24.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

@objc(NSKTopImageLayout)
internal class NSKTopImageLayout: NSKVerticalImageLayout {
    
    override class func titleRect(for contentRect: CGRect,
                                      defaultTitleRect: CGRect,
                                      imageRect: CGRect,
                                      titleEdgeInsets: UIEdgeInsets) -> CGRect {
        
        if !CGRectIsEmpty(defaultTitleRect) {
            
            let p =
                CGPoint(x: contentRect.midX - defaultTitleRect.width/2 + titleEdgeInsets.left - titleEdgeInsets.right,
                        y: contentRect.maxY - defaultTitleRect.height + titleEdgeInsets.top - titleEdgeInsets.bottom)
            
            return CGRect(origin: p, size: defaultTitleRect.size)
            
        } else {
            
            return super.titleRect(for: contentRect,
                                   defaultTitleRect: defaultTitleRect,
                                   imageRect: imageRect,
                                   titleEdgeInsets: titleEdgeInsets)
        }
    }
    
    override class func imageRect(for contentRect: CGRect,
                                      defaultImageRect: CGRect,
                                      titleRect: CGRect,
                                      imageEdgeInsets: UIEdgeInsets) -> CGRect {
        
        if !CGRectIsEmpty(defaultImageRect) {
            
            return CGRect(x: contentRect.midX - defaultImageRect.width/2 + imageEdgeInsets.left - imageEdgeInsets.right,
                          y: contentRect.minY + imageEdgeInsets.top - imageEdgeInsets.bottom,
                          width: defaultImageRect.width,
                          height: defaultImageRect.height)
        } else {
            
            return super.imageRect(for: contentRect,
                                   defaultImageRect: defaultImageRect,
                                   titleRect: titleRect,
                                   imageEdgeInsets: imageEdgeInsets)
        }
    }
}
