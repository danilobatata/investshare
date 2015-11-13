//
//  Helper.h
//  InvestShare
//
//  Created by Danilo Batata on 10/15/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class LoggedUser;
@interface Helper : NSObject

+ (instancetype)sharedInstance;
+ (LoggedUser *)loggedUser;
+ (void)saveCustomObject:(id)obj forKey:(NSString *)key;
+ (NSString *)randomName;
+ (NSString *)randomProfileImage;
+ (NSString *)randomRisk;
+ (NSInteger)randomValueUntil:(NSInteger)value;
+ (NSString *)formatCurrencyFromValue:(NSInteger)value;
+ (NSString *)formatTimeFromValue:(NSInteger)value;
+ (NSString *)initialsFromName:(NSString *)name;
+ (UIColor *)randomColor;

@end
