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
    
    return CGSizeMake(MAX(imageRect.size.width, titleRect.size.width),
                      imageRect.size.height + titleRect.size.height);
}

@end
