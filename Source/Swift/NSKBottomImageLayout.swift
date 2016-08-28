//
//  NSKBottomImageLayout.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 24.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

@objc(NSKBottomImageLayout)
internal class NSKBottomImageLayout: NSKDefaultImageLayout {
    
    override class func titleRect(for contentRect: CGRect,
                                      defaultTitleRect: CGRect,
                                      imageRect: CGRect,
                                      titleEdgeInsets: UIEdgeInsets) -> CGRect {
        
        if !CGRectIsEmpty(defaultTitleRect) {
            
            return CGRect(x: contentRect.midX - defaultTitleRect.width/2 + titleEdgeInsets.left - titleEdgeInsets.right,
                          y: contentRect.minY + titleEdgeInsets.top - titleEdgeInsets.bottom,
                          width: defaultTitleRect.width,
                          height: defaultTitleRect.height)
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
                          y: contentRect.maxY - defaultImageRect.height + imageEdgeInsets.top - imageEdgeInsets.bottom,
                          width: defaultImageRect.width,
                          height: defaultImageRect.height)
            
        } else {
            
            return super.imageRect(for: contentRect,
                                   defaultImageRect: defaultImageRect,
                                   titleRect: titleRect,
                                   imageEdgeInsets: imageEdgeInsets)
        }
    }
    
    override class func intrinsicContentSize(for defaultIntrinsicContentSize: CGSize,
                                                 imageRect: CGRect,
                                                 titleRect: CGRect) -> CGSize {
        
        let height = min(imageRect.height, titleRect.height)
        
        var intrinsicContentSize = defaultIntrinsicContentSize
        intrinsicContentSize.height += height
        
        return intrinsicContentSize
    }
}
