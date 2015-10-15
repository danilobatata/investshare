//
//  Helper.h
//  InvestShare
//
//  Created by Danilo Batata on 10/15/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Helper : NSObject

+ (instancetype)sharedInstance;
- (NSString *)randomName;
- (UIImage *)randomProfileImage;
- (NSString *)randomRisk;
- (NSInteger)randomValueUntil:(NSInteger)value;
- (NSString *)formatCurrencyFromValue:(NSInteger)value;
- (NSString *)formatTimeFromValue:(NSInteger)value;
- (NSArray *)randomInvestments;

@end
