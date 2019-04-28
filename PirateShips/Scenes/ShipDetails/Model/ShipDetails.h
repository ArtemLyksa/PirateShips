//
//  ShipDetails.h
//  PirateShips
//
//  Created by Artem Lyksa on 4/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Ship;

@interface ShipDetails : NSObject

- (instancetype)initWithShip:(Ship*)ship image:(UIImage*)image;

@property(strong, readonly, nonatomic) NSString *title;
@property(strong, readonly, nonatomic) NSString *price;
@property(strong, readonly, nonatomic) NSString *descrip;
@property(strong, readonly, nonatomic) NSString *greeting;
@property(strong, readonly, nonatomic) UIImage *image;

@end

NS_ASSUME_NONNULL_END
