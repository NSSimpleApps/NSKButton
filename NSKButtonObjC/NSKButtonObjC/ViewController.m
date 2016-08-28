//
//  ViewController.m
//  NSKButtonObjC
//
//  Created by NSSimpleApps on 21.08.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "ViewController.h"
#import "NSKButton.h"
#import "DecodeTestViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSKButton *nskButton;

@property (strong, nonatomic) NSArray<NSString *> *buttonTitles;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSKButton *toolBarButton1 =
    [[NSKButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    toolBarButton1.nskImagePosition = NSKImagePositionTop;
    [toolBarButton1 setTitle:@"Title1" forState:UIControlStateNormal];
    [toolBarButton1 setImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];
    [toolBarButton1 setTitleColor:[UIColor colorWithRed:0 green:122./255 blue:1 alpha:1]
                         forState:UIControlStateNormal];
    
    NSKButton *toolBarButton2 =
    [[NSKButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    toolBarButton2.nskImagePosition = NSKImagePositionTop;
    [toolBarButton2 setTitle:@"Title2" forState:UIControlStateNormal];
    [toolBarButton2 setImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];
    [toolBarButton2 setTitleColor:[UIColor colorWithRed:0 green:122./255 blue:1 alpha:1]
                         forState:UIControlStateNormal];
    
    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:toolBarButton1];
    buttonItem1.width = 80;
    
    UIBarButtonItem *buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:toolBarButton2];
    buttonItem2.width = 80;
    
    UIBarButtonItem *flexibleItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [self setToolbarItems:@[flexibleItem, buttonItem1, flexibleItem, buttonItem2, flexibleItem] animated:NO];
    [self.navigationController setToolbarHidden:NO animated:NO];
    
    
    self.buttonTitles = @[@"Default", @"Right", @"Top", @"Bottom"];
    
    self.nskButton.layer.borderColor = [UIColor colorWithRed:0
                                                       green:122./255
                                                        blue:1
                                                       alpha:1].CGColor;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ShowDecodeTestSegue"]) {
        
        DecodeTestViewController *decodeTestViewController = segue.destinationViewController;
        decodeTestViewController.data = [NSKeyedArchiver archivedDataWithRootObject:self.nskButton];
    }
}

@end
