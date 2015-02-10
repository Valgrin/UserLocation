//
//  CountryViewTest.m
//  UserLocation
//
//  Created by Guest User on 06/02/15.
//  Copyright (c) 2015 Thomas LEVY. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CountryView.h"

@interface TestPlacemark : CLPlacemark

@end

@implementation TestPlacemark

@end

@interface CountryViewTest : XCTestCase

@end

@implementation CountryViewTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testCountryViewShouldHaveDefaultValuesAfterInit
{
    CountryView *countryView = [[CountryView alloc] init];
    UILabel *countryLabel = (UILabel *)[countryView viewWithTag: kTagCountryViewLabel];
    UIImageView *flag = (UIImageView *)[countryView viewWithTag: kTagCountryViewFlag];
    
    XCTAssertTrue([countryLabel isKindOfClass: [UILabel class]]);
    XCTAssertTrue([flag isKindOfClass: [UIImageView class]]);
    
    XCTAssertTrue([countryLabel.text isEqualToString: @"None"]);
}

- (void)testSettingThePlacemarkShouldChangeTheLabelAndTheImage
{
    CountryView *countryView = [[CountryView alloc] init];
    UILabel *countryLabel = (UILabel *)[countryView viewWithTag: kTagCountryViewLabel];
    UIImageView *flag = (UIImageView *)[countryView viewWithTag: kTagCountryViewFlag];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder geocodeAddressString: @"Paris, France"
                 completionHandler: ^(NSArray *placemarks, NSError *error)
    {
        [countryView setPlacemark: [placemarks lastObject]];
        XCTAssertTrue([countryLabel.text isEqualToString: @"France"]);
        XCTAssertNotEqualObjects(flag.image, [UIImage imageNamed: @"default"]);
    }];
}

@end
