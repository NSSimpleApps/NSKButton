//
//  NSKBottomImageLayout.m
//  NSKButtonObjC
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "NSKBottomImageLayout.h"

@implementation NSKBottomImageLayout

+ (CGRect)titleRectForContentRect:(CGRect)contentRect
                 defaultTitleRect:(CGRect)defaultTitleRect
                        imageRect:(CGRect)imageRect
                  titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    
    if (!CGRectIsEmpty(defaultTitleRect)) {
        
        return CGRectMake(CGRectGetMidX(contentRect) - defaultTitleRect.size.width/2 + titleEdgeInsets.left - titleEdgeInsets.right,
                          CGRectGetMinY(contentRect) + titleEdgeInsets.top - titleEdgeInsets.bottom,
                          defaultTitleRect.size.width,
                          defaultTitleRect.size.height);
        
    } else {
        
        return defaultTitleRect;
    }
}

+ (CGRect)imageRectForContentRect:(CGRect)contentRect
                 defaultImageRect:(CGRect)defaultImageRect
                        titleRect:(CGRect)titleRect
                  imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    
    if (!CGRectIsEmpty(defaultImageRect)) {
        
        return CGRectMake(CGRectGetMidX(contentRect) - defaultImageRect.size.width/2 + imageEdgeInsets.left - imageEdgeInsets.right,
                          CGRectGetMaxY(contentRect) - defaultImageRect.size.height + imageEdgeInsets.top - imageEdgeInsets.bottom,
                          defaultImageRect.size.width,
                          defaultImageRect.size.height);
        
    } else {
        
        return defaultImageRect;
    }
}

+ (CGSize)intrinsicContentSizeForDefault:(CGSize)defaultIntrinsicContentSize
                               imageRect:(CGRect)imageRect
                               titleRect:(CGRect)titleRect {
    
    CGSize intrinsicContentSize = defaultIntrinsicContentSize;
    intrinsicContentSize.height += MIN(imageRect.size.height, titleRect.size.height);
    
    return intrinsicContentSize;
}

@end
