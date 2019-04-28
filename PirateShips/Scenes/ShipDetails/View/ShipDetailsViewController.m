//
//  ShipDetailsViewController.m
//  PirateShips
//
//  Created by Artem Lyksa on 4/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

#import "ShipDetailsViewController.h"
#import "PirateShips-Swift.h"

@interface ShipDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIButton *greetingButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation ShipDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewsOnLoad];
}

- (void)setupViewsOnLoad {
    [self.greetingButton dropShadow];
    [self.greetingButton setTitle:@"To greet".localized forState:UIControlStateNormal];
    self.navigationItem.title = @"Ship details".localized;
    [self configureWith:self.viewModel.details];
}

- (void)configureWith:(ShipDetails*)details {
    self.imageView.image = details.image;
    self.titleLabel.text = details.title;
    self.descriptionLabel.text = details.descrip;
    self.priceLabel.text = [NSString stringWithFormat:@"%@: %@", @"Price".localized, details.price];
}

- (IBAction)greetingAction:(UIButton*)sender {
    [self.viewModel greetShip];
}

@end
