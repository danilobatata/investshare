//
//  SuitabilityViewController.h
//  InvestShare
//
//  Created by Danilo Batata on 11/11/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SuitabilityDelegate <NSObject>

@required
- (void)suitabilityDidCancel;
- (void)suitabilityDidDismissWithRisk:(NSInteger)risk
                                 time:(NSInteger)time
                               income:(NSInteger)income
                                value:(NSInteger)value;

@end

@interface SuitabilityViewController : UITableViewController

@property (nonatomic, weak) id<SuitabilityDelegate> delegate;

@end
