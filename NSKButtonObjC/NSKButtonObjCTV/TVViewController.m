//
//  TVViewController.m
//  NSKButtonObjCTV
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "TVViewController.h"
#import "NSKButton.h"

@interface TVViewController ()

@property (weak, nonatomic) IBOutlet UIButton *nskButton;

@property (strong, nonatomic) NSArray<NSString *> *buttonTitles;

@end

@implementation TVViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.buttonTitles = @[@"Default", @"Right", @"Top", @"Bottom"];
    
    self.nskButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.nskButton.layer.borderWidth = 1;
    [self.nskButton setTitle:self.buttonTitles.firstObject forState:UIControlStateNormal];
}

- (IBAction)changeImagePosition:(NSKButton *)sender {
    
    if (sender.nskImagePosition == NSKImagePositionBottom) {
        
        sender.nskImagePosition = NSKImagePositionDefault;
        
    } else {
        
        sender.nskImagePosition++;
    }
    
    [sender setTitle:self.buttonTitles[sender.nskImagePosition] forState:UIControlStateNormal];
}

@end
