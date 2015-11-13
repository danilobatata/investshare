//
//  UserCell.m
//  InvestShare
//
//  Created by Danilo Batata on 11/6/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "UserCell.h"
#import "User+CoreDataProperties.h"

@interface UserCell ()

@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation UserCell

- (void)awakeFromNib {
    self.thumbImageView.layer.cornerRadius = 20.0;
    self.thumbImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.thumbImageView.layer.borderWidth = 0.5;
    self.thumbImageView.clipsToBounds = YES;
    
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUser:(User *)user {
    _user = user;
    _thumbImageView.image = [UIImage imageNamed:user.thumb];
    _nameLabel.text = user.name;
}

@end
