//
//  NSKRightImageLayout.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 24.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

private func CGRectFlipping(childRect: CGRect, in parentRect: CGRect) -> CGRect {
    var newRect = childRect
    newRect.origin.x = 2 * parentRect.midX - childRect.maxX
    
    return newRect
}

private func CGRect(rect: CGRect, movingByX x: CGFloat) -> CGRect {
    var newRect = rect
    newRect.origin.x += x
    
    return newRect
}

internal class NSKRightImageLayout: NSKDefaultImageLayout {
    
    override static func titleRect(forContentRect contentRect: CGRect,
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
                CGRect(rect: defaultTitleRect, movingByX: -(titleEdgeInsets.left - titleEdgeInsets.right))
            return CGRectFlipping(childRect: shiftedTitleRect, in: contentRect)
        }
    }
    
    override static func imageRect(forContentRect contentRect: CGRect,
                                  defaultImageRect: CGRect,
                                  titleRect: CGRect,
                                  imageEdgeInsets: UIEdgeInsets) -> CGRect {
        
        if defaultImageRect.isEmpty {
            return super.imageRect(forContentRect: contentRect,
                                   defaultImageRect: defaultImageRect,
                                   titleRect: titleRect,
                                   imageEdgeInsets: imageEdgeInsets)
            
        } else {
            let shiftedImageRect = CGRect(rect: defaultImageRect, movingByX: -imageEdgeInsets.left)
            let flippedImageRect = CGRectFlipping(childRect: shiftedImageRect, in: contentRect)
            
            return CGRect(rect: flippedImageRect, movingByX: imageEdgeInsets.left)
        }
    }
}
