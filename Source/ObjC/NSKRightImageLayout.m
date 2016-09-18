//
//  NSKRightImageLayout.m
//  NSKButtonObjC
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "NSKRightImageLayout.h"

CGRect CGRectFlippingChildRect(CGRect childRect, CGRect parentRect) {
    
    CGRect newRect = childRect;
    newRect.origin.x = 2 * CGRectGetMidX(parentRect) - CGRectGetMaxX(childRect);
    
    return newRect;
}
    
CGRect CGRectMovingByX(CGFloat x, CGRect rect) {
        
    CGRect newRect = rect;
    newRect.origin.x += x;
        
    return newRect;
}

@implementation NSKRightImageLayout

+ (CGRect)titleRectForContentRect:(CGRect)contentRect
                 defaultTitleRect:(CGRect)defaultTitleRect
                        imageRect:(CGRect)imageRect
                  titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    
    if (CGRectIsEmpty(defaultTitleRect)) {
        
        return [super titleRectForContentRect:contentRect
                             defaultTitleRect:defaultTitleRect
                                    imageRect:imageRect
                              titleEdgeInsets:titleEdgeInsets];
        
    } else {
        
        CGRect shiftedTitleRect =
        CGRectMovingByX(-(titleEdgeInsets.left - titleEdgeInsets.right), defaultTitleRect);
        
        return CGRectFlippingChildRect(shiftedTitleRect, contentRect);
    }
}

+ (CGRect)imageRectForContentRect:(CGRect)contentRect
                 defaultImageRect:(CGRect)defaultImageRect
                        titleRect:(CGRect)titleRect
                  imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    
    if (CGRectIsEmpty(defaultImageRect)) {
        
        return [super imageRectForContentRect:contentRect
                             defaultImageRect:defaultImageRect
                                    titleRect:titleRect
                              imageEdgeInsets:imageEdgeInsets];
        
    } else {
        
        CGRect shiftedImageRect = CGRectMovingByX(-imageEdgeInsets.left, defaultImageRect);
        
        CGRect flippedImageRect = CGRectFlippingChildRect(shiftedImageRect, contentRect);
        
        return CGRectMovingByX(imageEdgeInsets.left, flippedImageRect);
    }
}

@end
