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

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor: [UIColor whiteColor]];
    [self.view addSubview: self.localizeButton];
    [self.view addSubview: self.countryView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate: self];
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.localizeButton.center = self.view.center;
    self.countryView.center = CGPointMake(self.view.center.x, self.localizeButton.center.y + self.localizeButton.frame.size.height);
}

#pragma mark - Accessors

- (UIButton *)localizeButton
{
    if (_localizeButton == nil)
    {
        _localizeButton = [UIButton buttonWithType: UIButtonTypeCustom];
        [_localizeButton setTitle: @"Get Country" forState: UIControlStateNormal];
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

#pragma mark - Actions

- (void)buttonTouchUpInside:(id)sender
{
    if (self.locationManager.location)
    {
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation: self.locationManager.location completionHandler:^(NSArray *placemarks, NSError *error)
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
    else
    {
        NSLog(@"No user location");
    }
}

@end
