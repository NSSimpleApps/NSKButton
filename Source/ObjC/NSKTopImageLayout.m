//
//  NSKTopImageLayout.m
//  NSKButtonObjC
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "NSKTopImageLayout.h"

@implementation NSKTopImageLayout

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
        
        CGPoint p =
        CGPointMake(CGRectGetMidX(contentRect) - defaultTitleRect.size.width/2 + titleEdgeInsets.left - titleEdgeInsets.right,
                    CGRectGetMaxY(contentRect) - defaultTitleRect.size.height + titleEdgeInsets.top - titleEdgeInsets.bottom);
        
        return (CGRect){.origin = p, .size = defaultTitleRect.size};
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
        
        return CGRectMake(CGRectGetMidX(contentRect) - defaultImageRect.size.width/2 + imageEdgeInsets.left - imageEdgeInsets.right,
                          CGRectGetMinY(contentRect) + imageEdgeInsets.top - imageEdgeInsets.bottom,
                          defaultImageRect.size.width,
                          defaultImageRect.size.height);
    }
}

@end
