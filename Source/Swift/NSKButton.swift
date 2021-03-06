//
//  NSKButton.swift
//  NSKButtonSwift
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

private let NSKImagePositionKey = #keyPath(NSKButton.nskImagePosition)


@objc public enum NSKImagePosition: Int {
    
    case `default` = 0 // image on the left of title
    case right     = 1 // image on the right of title
    case top       = 2 // image on the top of title
    case bottom    = 3 // image on the bottom of title
}

open class NSKButton: UIButton {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private var nskImageLayout = NSKDefaultImageLayout.self
    
    #if TARGET_INTERFACE_BUILDER
    private var _nskImagePosition: Int = 0
    @IBInspectable open var nskImagePosition: Int {
    
        get { return self._nskImagePosition }
        set {
            if (0...3 ~= newValue) && (newValue != self._nskImagePosition) {
                let oldValue = NSKImagePosition(rawValue: self._nskImagePosition)!
                self._nskImagePosition = newValue
                self.invalidateImagePosition(with: oldValue, newValue: NSKImagePosition(rawValue: newValue)!)
            }
        }
    }
    
    #else
    
    private var _nskImagePosition: NSKImagePosition = .default
    @objc open var nskImagePosition: NSKImagePosition {
        
        get { return self._nskImagePosition }
        set {
            if newValue != self._nskImagePosition {
                let oldValue = self._nskImagePosition
                self._nskImagePosition = newValue
                self.invalidateImagePosition(oldValue: oldValue,
                                             newValue: newValue)
            }
        }
    }
    #endif
    
    private func invalidateImagePosition(oldValue: NSKImagePosition,
                                         newValue: NSKImagePosition) {
        self.invalidateNskImageLayout(with: newValue)
        
        if (abs(oldValue.rawValue - newValue.rawValue) >= 2) ||
            ((oldValue == .right) && (newValue == .top)) ||
            ((oldValue == .top) && (newValue == .right)) {
            
            self.invalidateIntrinsicContentSize()
        }
        
        self.setNeedsLayout()
    }
    
    override open func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let content: CGRect = {
            if self._nskImagePosition == .bottom || self._nskImagePosition == .top {
                return CGRect.infinite
                
            } else {
                return contentRect
            }
        }()
        let titleRect = super.titleRect(forContentRect: content)
        let imageRect = super.imageRect(forContentRect: content)
        
        return self.nskImageLayout.titleRect(forContentRect: contentRect,
                                             defaultTitleRect: titleRect,
                                             imageRect: imageRect,
                                             titleEdgeInsets: self.titleEdgeInsets)
    }
    
    override open func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let content: CGRect = {
            if self._nskImagePosition == .bottom || self._nskImagePosition == .top {
                return CGRect.infinite
                
            } else {
                return contentRect
            }
        }()
        let titleRect = super.titleRect(forContentRect: content)
        let imageRect = super.imageRect(forContentRect: content)
        
        return self.nskImageLayout.imageRect(forContentRect: contentRect,
                                             defaultImageRect: imageRect,
                                             titleRect: titleRect,
                                             imageEdgeInsets: self.imageEdgeInsets)
    }
    
    override open var intrinsicContentSize : CGSize {
        let imageRect = super.imageRect(forContentRect: CGRect.infinite)
        let titleRect = super.titleRect(forContentRect: CGRect.infinite)
        let defaultIntrinsicContentSize = super.intrinsicContentSize
        
        return self.nskImageLayout.intrinsicContentSize(forDefaultIntrinsicContentSize: defaultIntrinsicContentSize,
                                                        imageRect: imageRect,
                                                        titleRect: titleRect)
    }
    
    open override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        
        aCoder.encode(self.nskImagePosition.rawValue, forKey: NSKImagePositionKey)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let rawValue = aDecoder.decodeInteger(forKey: NSKImagePositionKey)
        self._nskImagePosition = NSKImagePosition(rawValue: rawValue) ?? .default
        self.invalidateNskImageLayout(with: self._nskImagePosition)
    }
    
    open func setNskImagePosition(_ imagePosition: NSKImagePosition, autoInvalidate: Bool) {
        if autoInvalidate {
            self.nskImagePosition = imagePosition
            
        } else {
            self._nskImagePosition = imagePosition
            self.invalidateNskImageLayout(with: imagePosition)
        }
    }
    
    private func invalidateNskImageLayout(with imagePosition: NSKImagePosition) {
        switch imagePosition {
            
        case .default:
            self.nskImageLayout = NSKDefaultImageLayout.self
        case .right:
            self.nskImageLayout = NSKRightImageLayout.self
        case .top:
            self.nskImageLayout = NSKTopImageLayout.self
        case .bottom:
            self.nskImageLayout = NSKBottomImageLayout.self
        }
    }
}
