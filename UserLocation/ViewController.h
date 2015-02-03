//
//  ViewController.h
//  UserLocation
//
//  Created by Thomas LEVY on 03/02/15.
//  Copyright (c) 2015 Thomas LEVY. All rights reserved.
//

#import <UIKit/UIKit.h>

static const NSInteger kTagButton = 1;
static const NSInteger kTagLabel = 2;

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UIButton *button;

- (IBAction)buttonTouchUpInside:(id)sender;

@end

