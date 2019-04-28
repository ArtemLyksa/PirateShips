//
//  ShipDetails.m
//  PirateShips
//
//  Created by Artem Lyksa on 4/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

#import "ShipDetails.h"
#import "PirateShips-Swift.h"

@interface ShipDetails()

@property(strong, nonatomic) NSString *greetingType;

@end

@implementation ShipDetails

- (instancetype)initWithShip:(Ship*)ship image:(UIImage*)image; {
    self = [super init];
    if (self) {
        _title = ship.title;
        _price = [NSString stringWithFormat:@"%.1f", ship.price];
        _greetingType = ship.greeting_type;
        _descrip = ship.details;
        _image = image;
    }
    return self;
}

- (NSString *)greeting {
    if ([self.greetingType isEqualToString:@"ay"]) {
        return @"Aye Aye!";
    } else if ([self.greetingType isEqualToString:@"ar"]) {
        return @"Arrr!";
    } else if ([self.greetingType isEqualToString:@"yo"]) {
        return @"Yo ho hooo!";
    } else {
        return @"Ahoi!";
    }
}

@end

