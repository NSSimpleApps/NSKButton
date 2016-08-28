//
//  NSKRightImageLayout.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 24.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

private func CGRectFlippingChildRect(childRect: CGRect, in parentRect: CGRect) -> CGRect {
    
    var newRect = childRect
    newRect.origin.x = 2 * parentRect.midX - childRect.maxX
    
    return newRect
}

private func CGRectMovingByX(rect: CGRect, x: CGFloat) -> CGRect {
    
    var newRect = rect
    newRect.origin.x += x
    
    return newRect
}

@objc(NSKRightImageLayout)
internal class NSKRightImageLayout: NSKDefaultImageLayout {
    
    override class func titleRect(for contentRect: CGRect,
                                      defaultTitleRect: CGRect,
                                      imageRect: CGRect,
                                      titleEdgeInsets: UIEdgeInsets) -> CGRect {
        
        if !CGRectIsEmpty(defaultTitleRect) {
            
            let shiftedTitleRect =
                CGRectMovingByX(defaultTitleRect,
                                x: -(titleEdgeInsets.left - titleEdgeInsets.right))
            
            return CGRectFlippingChildRect(shiftedTitleRect, in: contentRect)
            
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
            
            let shiftedImageRect = CGRectMovingByX(defaultImageRect, x: -imageEdgeInsets.left)
            
            let flippedImageRect = CGRectFlippingChildRect(shiftedImageRect, in: contentRect)
            
            return CGRectMovingByX(flippedImageRect, x: imageEdgeInsets.left)
            
        } else {
            
            return super.imageRect(for: contentRect,
                                   defaultImageRect: defaultImageRect,
                                   titleRect: titleRect,
                                   imageEdgeInsets: imageEdgeInsets)
        }
    }
}
