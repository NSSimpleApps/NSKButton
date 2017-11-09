//
//  NSKVerticalImageLayout.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 29.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit


internal class NSKVerticalImageLayout: NSKDefaultImageLayout {
    
    override static func intrinsicContentSize(forDefaultIntrinsicContentSize defaultIntrinsicContentSize: CGSize,
                                              imageRect: CGRect,
                                              titleRect: CGRect) -> CGSize {
        
        return CGSize(width: max(titleRect.width, imageRect.width),
                      height: titleRect.height + imageRect.height)
    }
}
