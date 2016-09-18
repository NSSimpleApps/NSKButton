//
//  NSKVerticalImageLayout.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 29.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

@objc(NSKVerticalImageLayout)
internal class NSKVerticalImageLayout: NSKDefaultImageLayout {
    
    override class func intrinsicContentSize(forDefaultIntrinsicContentSize defaultIntrinsicContentSize: CGSize,
                                                 imageRect: CGRect,
                                                 titleRect: CGRect) -> CGSize {
        
        let height = min(imageRect.height, titleRect.height)
        
        var intrinsicContentSize = defaultIntrinsicContentSize
        intrinsicContentSize.height += height
        
        return intrinsicContentSize
    }
}
