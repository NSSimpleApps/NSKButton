//
//  NSKVerticalImageLayout.m
//  NSKButtonObjC
//
//  Created by NSSimpleApps on 29.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "NSKVerticalImageLayout.h"

@implementation NSKVerticalImageLayout

+ (CGSize)intrinsicContentSizeForDefault:(CGSize)defaultIntrinsicContentSize
                               imageRect:(CGRect)imageRect
                               titleRect:(CGRect)titleRect {
    
    CGSize intrinsicContentSize = defaultIntrinsicContentSize;
    intrinsicContentSize.height += MIN(imageRect.size.height, titleRect.size.height);
    
    return intrinsicContentSize;
}

@end
