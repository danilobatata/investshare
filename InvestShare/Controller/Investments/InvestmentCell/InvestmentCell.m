//
//  InvestmentCell.m
//  InvestShare
//
//  Created by Danilo Batata on 10/15/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "InvestmentCell.h"
#import "Investment+CoreDataProperties.h"
#import "User+CoreDataProperties.h"
#import "Helper.h"

@interface InvestmentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *riskLabel;
@property (weak, nonatomic) IBOutlet UILabel *incomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UIView *incomeView;
@property (weak, nonatomic) IBOutlet UIView *riskView;
@property (weak, nonatomic) IBOutlet UIView *valueView;

@end

@implementation InvestmentCell

- (void)awakeFromNib {
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.cornerRadius = 25.0;
    self.profileImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.profileImageView.layer.borderWidth = 0.5;
    
    self.nameLabel.accessibilityIdentifier = @"nameLabel";
    
    self.incomeView.layer.cornerRadius = 5.0;
    self.incomeView.layer.shouldRasterize = YES;
    self.incomeView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.riskView.layer.cornerRadius = 5.0;
    self.riskView.layer.shouldRasterize = YES;
    self.riskView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.valueView.layer.cornerRadius = 5.0;
    self.valueView.layer.shouldRasterize = YES;
    self.valueView.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInvestment:(Investment *)investment {
    _investment = investment;
    
    User *user = investment.user;
    [self fillStarsWithRank:user.rank];
    self.profileImageView.image = [UIImage imageNamed:user.thumb];
    self.nameLabel.text = user.name;
    self.timeLabel.text = [NSString stringWithFormat:@"%d meses", investment.time];
    self.riskLabel.text = [self formatRiskFromValue:investment.risk];
    self.incomeLabel.text = [NSString stringWithFormat:@"%d%%", investment.income];
    self.valueLabel.text = [Helper formatCurrencyFromValue:investment.value];
}

- (NSString *)formatRiskFromValue:(NSInteger)value {
    switch (value) {
        case 1:
            return @"Risco A";
            
        case 2:
            return @"Risco B";
            
        case 3:
            return @"Risco C";
            
        case 4:
            return @"Risco D";
            
        default:
            NSLog(@"value out of bounds (1-4): %ld", (long)value);
            return nil;
    }
}

- (void)fillStarsWithRank:(NSInteger)rank {
    UIImage *image = [UIImage imageNamed:@"star_empty"];
    switch (rank) {
        case 0:
            self.star1.image = image;
            
        case 1:
            self.star2.image = image;
            
        case 2:
            self.star3.image = image;
            
        case 3:
            self.star4.image = image;
            
        case 4:
            self.star5.image = image;
            
        default:
            break;
    }
}

@end
