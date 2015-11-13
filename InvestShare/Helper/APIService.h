//
//  APIService.h
//  InvestShare
//
//  Created by Danilo Batata on 11/5/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User, Investment;
@interface APIService : NSObject

+ (instancetype)sharedInstance;

- (void)registerUser:(NSString *)name
               email:(NSString *)email
            password:(NSString *)password
            callback:(void (^)(NSError *error))callback;

- (void)login:(NSString *)email
     password:(NSString *)password
     callback:(void (^)(NSError *error))callback;

- (void)getUserFromEmail:(NSString *)email callback:(void (^)(User *user, NSError *error))callback;
- (void)getAllUsers:(void (^)(NSArray<User *> *users, NSError *error))callback;

- (void)getAllInvestments:(void (^)(NSArray<Investment *> *investments, NSError *error))callback;
- (void)getAllInvestmentsFromUser:(User *)user callback:(void (^)(NSArray<Investment *> *investments, NSError *error))callback;

- (void)fetchInvestmentsWithRisk:(NSInteger)risk time:(NSInteger)time income:(NSInteger)income value:(NSInteger)value callback:(void (^)(NSArray<Investment *> *investments, NSError *error))callback;
- (void)fetchInvestmentsFromUser:(User *)user withRisk:(NSInteger)risk time:(NSInteger)time income:(NSInteger)income value:(NSInteger)value callback:(void (^)(NSArray<Investment *> *investments, NSError *error))callback;

- (void)populateUsers:(void (^)(NSArray<User *> *users, NSError *error))callback;
- (void)deleteAllUsers:(void (^)(NSError *error))callback;

- (void)populateInvestments:(void (^)(NSArray<Investment *> *investments, NSError *error))callback;
- (void)deleteAllInvestments:(void (^)(NSError *error))callback;

@end
