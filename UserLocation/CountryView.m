//
//  CountryView.m
//  UserLocation
//
//  Created by Guest User on 05/02/15.
//  Copyright (c) 2015 Thomas LEVY. All rights reserved.
//

#import "CountryView.h"
#import "Flags.h"

@interface CountryView ()

@property (nonatomic, strong) UILabel *countryLabel;
@property (nonatomic, strong) UIImageView *flag;

@end

@implementation CountryView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self addSubview: self.countryLabel];
        [self addSubview: self.flag];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat viewHeight = self.countryLabel.frame.size.height;
    self.flag.frame = CGRectMake(0, 0, viewHeight * 2, viewHeight);
    self.countryLabel.frame = CGRectMake(self.flag.frame.size.width, 0, self.countryLabel.frame.size.width, self.countryLabel.frame.size.height);
    CGRect viewFrame = self.frame;
    viewFrame.size.height = viewHeight;
    viewFrame.size.width = self.frame.size.width + self.countryLabel.frame.size.width;
    self.frame = viewFrame;
}

#pragma mark - Accessors

- (UILabel *)countryLabel
{
    if (_countryLabel == nil)
    {
        _countryLabel = [[UILabel alloc] init];
        [_countryLabel setText: @"None"];
        [_countryLabel setTag: kTagCountryViewLabel];
        [_countryLabel sizeToFit];
    }
    return _countryLabel;
}

- (UIImageView *)flag
{
    if (_flag == nil)
    {
        _flag = [[UIImageView alloc] initWithImage: [Flags flagImageWithISOCountryCode: self.placemark.ISOcountryCode]];
        [_flag setTag: kTagCountryViewFlag];
    }
    return _flag;
}

- (void)setPlacemark:(CLPlacemark *)placemark
{
    if (_placemark != placemark)
    {
        _placemark = placemark;
        [self.countryLabel setText: placemark ? placemark.country : @"None"];
        [self.countryLabel sizeToFit];
        [self.flag setImage: [Flags flagImageWithISOCountryCode: self.placemark.ISOcountryCode]];
    }
}

@end
