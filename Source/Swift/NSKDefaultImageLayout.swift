//
//  NSKDefaultImageLayout.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 24.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

internal class NSKDefaultImageLayout {
    
    private init() { }
    
    class func titleRect(forContentRect contentRect: CGRect,
                         defaultTitleRect: CGRect,
                         imageRect: CGRect,
                         titleEdgeInsets: UIEdgeInsets) -> CGRect {
        return defaultTitleRect
    }
    
    class func imageRect(forContentRect contentRect: CGRect,
                         defaultImageRect: CGRect,
                         titleRect: CGRect,
                         imageEdgeInsets: UIEdgeInsets) -> CGRect {
        return defaultImageRect
    }
    
    class func intrinsicContentSize(forDefaultIntrinsicContentSize defaultIntrinsicContentSize: CGSize,
                                    imageRect: CGRect,
                                    titleRect: CGRect) -> CGSize {
        return defaultIntrinsicContentSize
    }
}
