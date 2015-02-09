//
//  ViewController.m
//  UserLocation
//
//  Created by Thomas LEVY on 03/02/15.
//  Copyright (c) 2015 Thomas LEVY. All rights reserved.
//

#import "ViewController.h"
#import "CountryView.h"

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) UIButton *localizeButton;
@property (nonatomic, strong) CountryView *countryView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, assign) BOOL displayCountry;

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor: [UIColor whiteColor]];
    [self.view addSubview: self.localizeButton];
    [self.view addSubview: self.countryView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.localizeButton.center = self.view.center;
    self.countryView.center = CGPointMake(self.view.center.x, self.localizeButton.center.y + self.localizeButton.frame.size.height);
}

#pragma mark - Accessors

- (CLLocationManager *)locationManager
{
    if (_locationManager == nil)
    {
        _locationManager = [[CLLocationManager alloc] init];
        [_locationManager setDelegate: self];
        if ([_locationManager respondsToSelector: @selector(requestWhenInUseAuthorization)])
        {
            [_locationManager requestWhenInUseAuthorization];
        }
    }
    return _locationManager;
}

- (UIButton *)localizeButton
{
    if (_localizeButton == nil)
    {
        _localizeButton = [UIButton buttonWithType: UIButtonTypeCustom];
        [_localizeButton setTitle: @"Localize" forState: UIControlStateNormal];
        [_localizeButton setBackgroundColor: [UIColor grayColor]];
        [_localizeButton addTarget: self action: @selector(buttonTouchUpInside:) forControlEvents: UIControlEventTouchUpInside];
        [_localizeButton setTag: kTagButton];
        [_localizeButton sizeToFit];
    }
    return _localizeButton;
}

- (CountryView *)countryView
{
    if (_countryView == nil)
    {
        _countryView = [[CountryView alloc] init];
        [_countryView setTag: kTagCountryView];
        [_countryView setNeedsLayout];
    }
    return _countryView;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation: [locations lastObject] completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!error)
         {
             [self.countryView setPlacemark: [placemarks lastObject]];
             [self.countryView setNeedsLayout];
         }
         else
         {
             NSLog(@"Error: %@", error.localizedDescription);
         }
     }];
}

#pragma mark - Actions

- (void)buttonTouchUpInside:(id)sender
{
    self.displayCountry = !self.displayCountry;
    if (self.displayCountry)
    {
        [self.locationManager startUpdatingLocation];
    }
    else
    {
        [self.locationManager stopUpdatingLocation];
        [self.countryView setPlacemark: nil];
        [self.countryView setNeedsLayout];
    }
}

@end
