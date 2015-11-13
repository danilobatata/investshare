//
//  InvestmentsViewController.h
//  InvestShare
//
//  Created by Danilo Batata on 10/15/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Investment, User;
@interface InvestmentsViewController : UITableViewController

@property (nonatomic, strong) User *user;

@end
