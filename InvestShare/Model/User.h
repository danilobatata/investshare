//
//  User.h
//  InvestShare
//
//  Created by Danilo Batata on 11/6/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Investment;

NS_ASSUME_NONNULL_BEGIN

@interface User : NSManagedObject

@property (nonatomic, assign) NSString *password;

@end

NS_ASSUME_NONNULL_END

#import "User+CoreDataProperties.h"
