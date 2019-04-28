//
//  ShipDetailsViewModel.m
//  PirateShips
//
//  Created by Artem Lyksa on 4/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

#import "ShipDetailsViewModel.h"
#import "PirateShips-Swift.h"

@interface ShipDetailsViewModel()

@end

@implementation ShipDetailsViewModel

- (instancetype)initWithShip:(Ship*)ship image:(UIImage*)image {
    self = [super init];
    if (self) {
        _details = [[ShipDetails alloc] initWithShip:ship image:image];
    }
    return self;
}

- (void)greetShip {
    [self.delegate displayGreeting:self.details.greeting];
}

@end
