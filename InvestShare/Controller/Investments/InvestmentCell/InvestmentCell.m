//
//  InvestmentCell.m
//  InvestShare
//
//  Created by Danilo Batata on 10/15/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "InvestmentCell.h"
#import "VOInvestment.h"

@interface InvestmentCell ()

@property (weak, nonatomic) IBOutlet UIView *bkgView;
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
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation InvestmentCell

- (void)awakeFromNib {
    
    /*
     *  Shadow
     */
    self.bkgView.layer.masksToBounds = NO;
    self.bkgView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.bkgView.layer.shadowOffset = CGSizeZero;
    self.bkgView.layer.shadowOpacity = 2.0;
    self.bkgView.layer.shadowRadius = 2.0;
//    self.bkgView.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bkgView.frame].CGPath;
    
    /*
     *  Thumbnail
     */
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.cornerRadius = 25.0;
    self.profileImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.profileImageView.layer.borderWidth = 0.5;
    
    self.nameLabel.accessibilityIdentifier = @"nameLabel";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInvestment:(VOInvestment *)investment {
    _investment = investment;
    
    self.profileImageView.image = investment.thumb;
    self.nameLabel.text = investment.name;
    self.timeLabel.text = investment.time;
    self.riskLabel.text = investment.risk;
    self.incomeLabel.text = investment.income;
    self.valueLabel.text = investment.value;
    self.descriptionLabel.text = investment.desc;
}

@end
