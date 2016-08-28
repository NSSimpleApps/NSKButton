//
//  NSKDefaultImageLayout.m
//  NSKButtonObjC
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "NSKDefaultImageLayout.h"


@implementation NSKDefaultImageLayout

+ (CGRect)titleRectForContentRect:(CGRect)contentRect
                 defaultTitleRect:(CGRect)defaultTitleRect
                        imageRect:(CGRect)imageRect
                  titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    
    return defaultTitleRect;
}

+ (CGRect)imageRectForContentRect:(CGRect)contentRect
                 defaultImageRect:(CGRect)defaultImageRect
                        titleRect:(CGRect)titleRect
                  imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    
    return defaultImageRect;
}

+ (CGSize)intrinsicContentSizeForDefault:(CGSize)defaultIntrinsicContentSize
                               imageRect:(CGRect)imageRect
                               titleRect:(CGRect)titleRect {
    
    return defaultIntrinsicContentSize;
}

@end
