//
//  NSKButton.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

private let NSKImagePositionKey = "nskImagePosition"
private let NSKImageLayoutKey = "nskImageLayout"


@objc public enum NSKButtonImagePosition: Int {
    
    case Default // image on the left of title
    case Right   // image on the right of title
    case Top     // image on the top of title
    case Bottom  // image on the bottom of title
}

public class NSKButton: UIButton {
    
    override public init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    private var nskImageLayout = NSKDefaultImageLayout.self
        
    #if TARGET_INTERFACE_BUILDER
    
    @IBInspectable public var nskImagePosition: Int = 0 {
    
        didSet {
    
            if (0...3 ~= self.nskImagePosition) && (oldValue != self.nskImagePosition) {
    
                let oldValue = NSKButtonImagePosition(rawValue: oldValue)!
                let newValue = NSKButtonImagePosition(rawValue: self.nskImagePosition)!
    
                self.invalidateImagePosition(with: oldValue, newValue: newValue)
            }
        }
    }
    #else
    public var nskImagePosition: NSKButtonImagePosition = .Default {
            
        didSet {
            
            if oldValue != self.nskImagePosition {
                    
                self.invalidateImagePosition(with: oldValue,
                                             newValue: self.nskImagePosition)
            }
        }
    }
    #endif
    
    private func invalidateImagePosition(with oldValue: NSKButtonImagePosition,
                                              newValue: NSKButtonImagePosition) {
        
        switch newValue {
            
        case .Default:
            self.nskImageLayout = NSKDefaultImageLayout.self
            
        case .Right:
            self.nskImageLayout = NSKRightImageLayout.self
            
        case .Top:
            self.nskImageLayout = NSKTopImageLayout.self
            
        case .Bottom:
            self.nskImageLayout = NSKBottomImageLayout.self
        }
        
        if (abs(oldValue.rawValue - newValue.rawValue) >= 2) ||
            ((oldValue == .Right) && (newValue == .Top)) ||
            ((oldValue == .Top) && (newValue == .Right)) {
            
            self.invalidateIntrinsicContentSize()
        }
        
        self.setNeedsLayout()
    }
    
    override public func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        
        let titleRect = super.titleRectForContentRect(contentRect)
        let imageRect = super.imageRectForContentRect(contentRect)
        
        return self.nskImageLayout.titleRect(for: contentRect,
                                             defaultTitleRect: titleRect,
                                             imageRect: imageRect,
                                             titleEdgeInsets: self.titleEdgeInsets)
    }
    
    override public func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        
        let titleRect = super.titleRectForContentRect(contentRect)
        let imageRect = super.imageRectForContentRect(contentRect)
        
        return self.nskImageLayout.imageRect(for: contentRect,
                                             defaultImageRect: imageRect,
                                             titleRect: titleRect,
                                             imageEdgeInsets: self.imageEdgeInsets)
    }
    
    override public func intrinsicContentSize() -> CGSize {
        
        let contentRect = self.contentRectForBounds(self.bounds)
        let imageRect = super.imageRectForContentRect(contentRect)
        let titleRect = super.titleRectForContentRect(contentRect)
        let defaultIntrinsicContentSize = super.intrinsicContentSize()
        
        return self.nskImageLayout.intrinsicContentSize(for: defaultIntrinsicContentSize,
                                                        imageRect: imageRect,
                                                        titleRect: titleRect)
    }
    
    public override func encodeWithCoder(aCoder: NSCoder) {
        
        super.encodeWithCoder(aCoder)
        
        aCoder.encodeInteger(self.nskImagePosition.rawValue, forKey: NSKImagePositionKey)
        aCoder.encodeObject(NSStringFromClass(self.nskImageLayout), forKey: NSKImageLayoutKey)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let rawValue = aDecoder.decodeIntegerForKey(NSKImagePositionKey)
        self.nskImagePosition = NSKButtonImagePosition(rawValue: rawValue) ?? .Default
        
        if let string = aDecoder.decodeObjectForKey(NSKImageLayoutKey) as? String,
            let cl = NSClassFromString(string) as? NSKDefaultImageLayout.Type {
            
            self.nskImageLayout = cl
            
        } else {
            
            self.nskImageLayout = NSKDefaultImageLayout.self
        }
    }
}
