//
//  Investment+CoreDataProperties.h
//  InvestShare
//
//  Created by Danilo Batata on 11/13/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Investment.h"

NS_ASSUME_NONNULL_BEGIN

@interface Investment (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *desc;
@property (nonatomic) int16_t income;
@property (nonatomic) int16_t risk;
@property (nonatomic) int16_t time;
@property (nonatomic) int64_t value;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
