//
//  ShipDetailsViewController.h
//  PirateShips
//
//  Created by Artem Lyksa on 4/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShipDetailsViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShipDetailsViewController : UIViewController

@property(strong, nonatomic) ShipDetailsViewModel* viewModel;

@end

NS_ASSUME_NONNULL_END
