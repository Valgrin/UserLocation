//
//  FlagsTest.m
//  UserLocation
//
//  Created by Guest User on 06/02/15.
//  Copyright (c) 2015 Thomas LEVY. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Flags.h"

@interface FlagsTest : XCTestCase

@end

@implementation FlagsTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testShouldCreateAnImageWithDefaultPicture
{
    UIImage *image = [Flags flagImageWithISOCountryCode: nil];
    XCTAssertNotNil(image);
    XCTAssertEqualObjects(image, [UIImage imageNamed: @"default"]);
}

- (void)testShouldCreateAnImageWithFlagPicture
{
    UIImage *image = [Flags flagImageWithISOCountryCode: @"fr"];
    XCTAssertNotNil(image);
    XCTAssertNotEqualObjects(image, [UIImage imageNamed: @"default"]);
}

@end
