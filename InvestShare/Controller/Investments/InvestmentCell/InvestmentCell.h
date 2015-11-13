//
//  InvestmentCell.h
//  InvestShare
//
//  Created by Danilo Batata on 10/15/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Investment;
@interface InvestmentCell : UITableViewCell

@property (nonatomic, strong) Investment *investment;

@end
