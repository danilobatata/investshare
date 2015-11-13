//
//  User+CoreDataProperties.h
//  InvestShare
//
//  Created by Danilo Batata on 11/6/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *name;
@property (nonatomic) int16_t rank;
@property (nullable, nonatomic, retain) NSString *thumb;
@property (nonatomic) int16_t code;
@property (nullable, nonatomic, retain) NSSet<Investment *> *investments;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addInvestmentsObject:(Investment *)value;
- (void)removeInvestmentsObject:(Investment *)value;
- (void)addInvestments:(NSSet<Investment *> *)values;
- (void)removeInvestments:(NSSet<Investment *> *)values;

@end

NS_ASSUME_NONNULL_END
