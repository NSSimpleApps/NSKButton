//
//  NSKBottomImageLayout.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 24.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit


internal class NSKBottomImageLayout: NSKVerticalImageLayout {
    
    override static func titleRect(forContentRect contentRect: CGRect,
                                  defaultTitleRect: CGRect,
                                  imageRect: CGRect,
                                  titleEdgeInsets: UIEdgeInsets) -> CGRect {
        
        return CGRect(x: contentRect.midX - defaultTitleRect.width/2 + titleEdgeInsets.left - titleEdgeInsets.right,
                      y: contentRect.minY + titleEdgeInsets.top - titleEdgeInsets.bottom,
                      width: defaultTitleRect.width,
                      height: defaultTitleRect.height)
    }
    
    override static func imageRect(forContentRect contentRect: CGRect,
                                  defaultImageRect: CGRect,
                                  titleRect: CGRect,
                                  imageEdgeInsets: UIEdgeInsets) -> CGRect {
        
        return CGRect(x: contentRect.midX - defaultImageRect.width/2 + imageEdgeInsets.left - imageEdgeInsets.right,
                      y: contentRect.maxY - defaultImageRect.height + imageEdgeInsets.top - imageEdgeInsets.bottom,
                      width: defaultImageRect.width,
                      height: defaultImageRect.height)
    }
}
