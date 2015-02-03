//
//  ViewControllerTest.m
//  UserLocation
//
//  Created by Thomas LEVY on 03/02/15.
//  Copyright (c) 2015 Thomas LEVY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTest : XCTestCase

@property (nonatomic, strong) ViewController *controller;

@end

@implementation ViewControllerTest

- (void)setUp
{
    [super setUp];
    self.controller = [[UIStoryboard storyboardWithName: @"Main" bundle: nil]instantiateViewControllerWithIdentifier: @"ViewController"];
}

- (void)tearDown
{
    self.controller = nil;
    [super tearDown];
}

- (void)testControllerShouldInitTheButton
{
    UIButton *button = (UIButton *)[self.controller.view viewWithTag: kTagButton];
    XCTAssertTrue([button isKindOfClass: [UIButton class]]);
    XCTAssertTrue([button.titleLabel.text isEqualToString: @"Get Country"]);
    XCTAssertTrue([button actionsForTarget: self.controller
                           forControlEvent: UIControlEventTouchUpInside].count == 1);
}

- (void)testControllerShouldInitTheLabel
{
    UILabel *label = (UILabel *)[self.controller.view viewWithTag: kTagLabel];
    XCTAssertTrue([label isKindOfClass: [UILabel class]]);
    XCTAssertTrue([label.text isEqualToString: @""]);
}

- (void)testTappingOnButtonShouldChangeTheLabel
{
    UIButton *button = (UIButton *)[self.controller.view viewWithTag: kTagButton];
    UILabel *label = (UILabel *)[self.controller.view viewWithTag: kTagLabel];
    NSString *oldLabel = label.text;
    [button sendActionsForControlEvents: UIControlEventTouchUpInside];
    NSString *newLabel = label.text;
    XCTAssertFalse([oldLabel isEqualToString: newLabel]);
}


@end
