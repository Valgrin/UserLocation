//
//  Flags.m
//  UserLocation
//
//  Created by Guest User on 05/02/15.
//  Copyright (c) 2015 Thomas LEVY. All rights reserved.
//

#import "Flags.h"

@implementation Flags

+ (UIImage *)flagImageWithISOCountryCode: (NSString *)countryCode
{
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat: @"http://net.rodage.com/flags/%@.gif", [countryCode uppercaseString]]];
    NSData *data = [NSData dataWithContentsOfURL: url];
    UIImage *img = [[UIImage alloc] initWithData: data];
    if (img == nil)
        return [Flags defaultImageFlag];
    return img;
}

#pragma mark - Private

+ (UIImage *)defaultImageFlag
{
    return [UIImage imageNamed: @"default"];
}

@end
