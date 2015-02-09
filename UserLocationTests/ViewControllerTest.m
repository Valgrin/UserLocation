//
//  ViewControllerTest.m
//  UserLocation
//
//  Created by Thomas LEVY on 03/02/15.
//  Copyright (c) 2015 Thomas LEVY. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "CountryView.h"

@interface ViewControllerTest : XCTestCase

@property (nonatomic, strong) ViewController *controller;

@end

@implementation ViewControllerTest

- (void)setUp
{
    [super setUp];
    self.controller = [[ViewController alloc] init];
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

- (void)testControllerShouldInitTheCountryView
{
    CountryView *countryView = (CountryView *)[self.controller.view viewWithTag: kTagCountryView];
    XCTAssertTrue([countryView isKindOfClass: [CountryView class]]);
    XCTAssertNil(countryView.placemark);
}

@end
