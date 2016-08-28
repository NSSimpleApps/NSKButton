//
//  NSKDefaultImageLayout.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 24.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

@objc (NSKDefaultImageLayout)
internal class NSKDefaultImageLayout: NSObject {
    
    private override init() {
        
        super.init()
    }
    
    class func titleRect(for contentRect: CGRect,
                             defaultTitleRect: CGRect,
                             imageRect: CGRect,
                             titleEdgeInsets: UIEdgeInsets) -> CGRect {
        
        return defaultTitleRect
    }
    
    class func imageRect(for contentRect: CGRect,
                             defaultImageRect: CGRect,
                             titleRect: CGRect,
                             imageEdgeInsets: UIEdgeInsets) -> CGRect {
        
        return defaultImageRect
    }
    
    class func intrinsicContentSize(for defaultIntrinsicContentSize: CGSize,
                                        imageRect: CGRect,
                                        titleRect: CGRect) -> CGSize {
        
        return defaultIntrinsicContentSize
    }
}
