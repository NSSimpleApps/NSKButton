//
//  DecodeTestViewController.m
//  NSKButtonObjC
//
//  Created by NSSimpleApps on 24.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "DecodeTestViewController.h"
#import "NSKButton.h"

@interface DecodeTestViewController ()

@end

@implementation DecodeTestViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Decode NSKButton";
    
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:self.data];
    
    if (object && [object isKindOfClass:[NSKButton class]]) {
        
        NSKButton *button = object;
        button.center = self.view.center;
        
        [self.view addSubview:button];
        
        NSLayoutConstraint *horizontalConstraint = [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
        NSLayoutConstraint *vertivalConstraint = [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
        
        [NSLayoutConstraint activateConstraints:@[horizontalConstraint, vertivalConstraint]];
    }
    
}


@end
