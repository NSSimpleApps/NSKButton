//
//  NSKButton.h
//  NSKButtonObjC
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NSKImagePosition) {
    
    NSKImagePositionDefault = 0, // image on the left of title
    NSKImagePositionRight   = 1, // image on the right of title
    NSKImagePositionTop     = 2, // image on the top of title
    NSKImagePositionBottom  = 3  // image on the bottom of title
};

//IB_DESIGNABLE
@interface NSKButton : UIButton

#if TARGET_INTERFACE_BUILDER
@property (nonatomic, assign) IBInspectable NSInteger nskImagePosition;
#else
@property (nonatomic, assign) NSKImagePosition nskImagePosition;
#endif

@end
