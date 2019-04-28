//
//  ShipDetailsViewModel.h
//  PirateShips
//
//  Created by Artem Lyksa on 4/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShipDetails.h"

NS_ASSUME_NONNULL_BEGIN

@class Ship;
@protocol ShipDetailsCoordinatorDelegate;

@interface ShipDetailsViewModel : NSObject

@property(strong, readonly, nonatomic) ShipDetails *details;
@property(weak, nonatomic) id<ShipDetailsCoordinatorDelegate> delegate;

- (instancetype)initWithShip:(Ship*)ship image:(UIImage*)image;
- (void)greetShip;

@end

NS_ASSUME_NONNULL_END
