//
//  NSKButton.m
//  NSKButtonObjC
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "NSKButton.h"
#import "NSKDefaultImageLayout.h"
#import "NSKRightImageLayout.h"
#import "NSKTopImageLayout.h"
#import "NSKBottomImageLayout.h"

static NSString *const NSKImagePositionKey = @"nskImagePosition";

@interface NSKButton ()

@property (nonatomic, strong) Class nskImageLayout;

@end

@implementation NSKButton

- (Class)nskImageLayout {
    
    if (_nskImageLayout == Nil) {
        
        _nskImageLayout = [NSKDefaultImageLayout class];
    }
    
    return _nskImageLayout;
}

- (void)setNskImagePosition:(NSKImagePosition)nskImagePosition {
    
    if ((nskImagePosition >= 0) && (nskImagePosition <= 3) && (_nskImagePosition != nskImagePosition)) {
        
        [self invalidateNskImageLayoutWithImagePosition:nskImagePosition];
        
        if ((ABS(_nskImagePosition - nskImagePosition) >= 2) ||
            ((_nskImagePosition == NSKImagePositionRight) && (nskImagePosition == NSKImagePositionTop)) ||
            ((_nskImagePosition == NSKImagePositionTop) && (nskImagePosition == NSKImagePositionRight))) {
            
            [self invalidateIntrinsicContentSize];
        }
        
        _nskImagePosition = nskImagePosition;
        
        [self setNeedsLayout];
    }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGRect defaultTitleRect = [super titleRectForContentRect:contentRect];
    CGRect imageRect = [super imageRectForContentRect:contentRect];
    
    return [self.nskImageLayout titleRectForContentRect:contentRect
                                       defaultTitleRect:defaultTitleRect
                                              imageRect:imageRect
                                        titleEdgeInsets:self.titleEdgeInsets];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGRect titleRect = [super titleRectForContentRect:contentRect];
    CGRect defaultImageRect = [super imageRectForContentRect:contentRect];
    
    return [self.nskImageLayout imageRectForContentRect:contentRect
                                       defaultImageRect:defaultImageRect
                                              titleRect:titleRect
                                        imageEdgeInsets:self.imageEdgeInsets];
}

- (CGSize)intrinsicContentSize {
    
    CGRect contentRect = [self contentRectForBounds:self.bounds];
    CGRect imageRect = [super imageRectForContentRect:contentRect];
    CGRect titleRect = [super titleRectForContentRect:contentRect];
    CGSize defaultIntrinsicContentSize = [super intrinsicContentSize];
    
    return
    [self.nskImageLayout intrinsicContentSizeForDefault:defaultIntrinsicContentSize
                                              imageRect:imageRect
                                              titleRect:titleRect];
}

#pragma -mark NSCoding-protocol conformance

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeInteger:self.nskImagePosition forKey:NSKImagePositionKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        NSInteger decodedInteger = [aDecoder decodeIntegerForKey:NSKImagePositionKey];
        
        if (decodedInteger >= 0 && decodedInteger <= 3) {
            
            _nskImagePosition = decodedInteger;
            
        } else {
            
            _nskImagePosition = NSKImagePositionDefault;
        }
        
        [self invalidateNskImageLayoutWithImagePosition:_nskImagePosition];
    }
    
    return self;
}

- (void)setNskImagePosition:(NSKImagePosition)imagePosition autoInvalidate:(BOOL)autoInvalidate {
    
    if (autoInvalidate) {
        
        self.nskImagePosition = imagePosition;
        
    } else {
        
        _nskImagePosition = imagePosition;
        [self invalidateNskImageLayoutWithImagePosition:imagePosition];
    }
}

- (void)invalidateNskImageLayoutWithImagePosition:(NSKImagePosition)imagePosition {
    
    switch (imagePosition) {
            
        case NSKImagePositionDefault:
            self.nskImageLayout = [NSKDefaultImageLayout class];
            break;
        case NSKImagePositionRight:
            self.nskImageLayout = [NSKRightImageLayout class];
            break;
        case NSKImagePositionTop:
            self.nskImageLayout = [NSKTopImageLayout class];
            break;
        case NSKImagePositionBottom:
            self.nskImageLayout = [NSKBottomImageLayout class];
            break;
    }
}

@end

