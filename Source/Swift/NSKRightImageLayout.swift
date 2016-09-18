//
//  NSKRightImageLayout.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 24.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

private func CGRectFlippingChildRect(_ childRect: CGRect, in parentRect: CGRect) -> CGRect {
    
    var newRect = childRect
    newRect.origin.x = 2 * parentRect.midX - childRect.maxX
    
    return newRect
}

private func CGRectMovingByX(_ rect: CGRect, x: CGFloat) -> CGRect {
    
    var newRect = rect
    newRect.origin.x += x
    
    return newRect
}

@objc(NSKRightImageLayout)
internal class NSKRightImageLayout: NSKDefaultImageLayout {
    
    override class func titleRect(forContentRect contentRect: CGRect,
                                  defaultTitleRect: CGRect,
                                  imageRect: CGRect,
                                  titleEdgeInsets: UIEdgeInsets) -> CGRect {
        
        if defaultTitleRect.isEmpty {
            
            return super.titleRect(forContentRect: contentRect,
                                   defaultTitleRect: defaultTitleRect,
                                   imageRect: imageRect,
                                   titleEdgeInsets: titleEdgeInsets)
            
        } else {
            
            let shiftedTitleRect =
                CGRectMovingByX(defaultTitleRect,
                                x: -(titleEdgeInsets.left - titleEdgeInsets.right))
            
            return CGRectFlippingChildRect(shiftedTitleRect, in: contentRect)
        }
    }
    
    override class func imageRect(forContentRect contentRect: CGRect,
                                  defaultImageRect: CGRect,
                                  titleRect: CGRect,
                                  imageEdgeInsets: UIEdgeInsets) -> CGRect {
        
        if defaultImageRect.isEmpty {
            
            return super.imageRect(forContentRect: contentRect,
                                   defaultImageRect: defaultImageRect,
                                   titleRect: titleRect,
                                   imageEdgeInsets: imageEdgeInsets)
            
        } else {
            
            let shiftedImageRect = CGRectMovingByX(defaultImageRect, x: -imageEdgeInsets.left)
            
            let flippedImageRect = CGRectFlippingChildRect(shiftedImageRect, in: contentRect)
            
            return CGRectMovingByX(flippedImageRect, x: imageEdgeInsets.left)
        }
    }
}
