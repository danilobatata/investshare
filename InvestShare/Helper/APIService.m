//
//  APIService.m
//  InvestShare
//
//  Created by Danilo Batata on 11/5/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "APIService.h"
#import "Macros.h"
#import "Helper.h"
#import "User+CoreDataProperties.h"
#import "Investment+CoreDataProperties.h"
#import "LoggedUser.h"
#import <MagicalRecord/MagicalRecord.h>

#define kDomain @"InvestShareAPI"

@implementation APIService

+ (instancetype)sharedInstance {
    static APIService *shared = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    
    return shared;
}

- (void)saveUserInfo:(User *)user {
    LoggedUser *loggedUser = [[LoggedUser alloc] initWithUser:user];
    [Helper saveCustomObject:loggedUser forKey:kProfileInfo];
}

#pragma mark - Login & Register
- (void)registerUser:(NSString *)name email:(NSString *)email password:(NSString *)password callback:(void (^)(NSError *error))callback {
    __block User *user = [User MR_findFirstByAttribute:@"email" withValue:email];
    if (user) {
        callback([NSError errorWithDomain:kDomain code:400 userInfo:nil]);
    }
    else {
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
            user = [User MR_createEntityInContext:localContext];
            user.name = name;
            user.email = email;
            user.password = password;
            user.code = 0;
            user.rank = 0;
        } completion:^(BOOL contextDidSave, NSError *error) {
            if (contextDidSave) {
                [self saveUserInfo:user];
                callback(nil);
            }
            else {
                callback(error);
            }
        }];
    }
}

- (void)login:(NSString *)email password:(NSString *)password callback:(void (^)(NSError *error))callback {
    User *user = [User MR_findFirstByAttribute:@"email" withValue:email];
    if (user) {
        if ([password isEqualToString:user.password]) {
            [self saveUserInfo:user];
            callback(nil);
        }
        else {
            callback([NSError errorWithDomain:kDomain code:400 userInfo:nil]);
        }
    }
    else {
        callback([NSError errorWithDomain:kDomain code:400 userInfo:nil]);
    }
}

#pragma mark - Listing
- (void)getUserFromEmail:(NSString *)email callback:(void (^)(User *, NSError *))callback {
    User *_user = [User MR_findFirstByAttribute:@"email" withValue:email];
    if (!_user) {
        callback(nil, [NSError errorWithDomain:kDomain code:400 userInfo:nil]);
    }
    else {
        callback(_user, nil);
    }
}

- (void)getAllUsers:(void (^)(NSArray<User *> *, NSError *))callback {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"code > 0"];
    NSArray *_users = [User MR_findAllWithPredicate:predicate];
    if (!_users) {
        callback(nil, [NSError errorWithDomain:kDomain code:400 userInfo:nil]);
    }
    else {
        callback(_users, nil);
    }
}

- (void)getAllInvestments:(void (^)(NSArray<Investment *> *, NSError *))callback {
    NSArray *_investments = [Investment MR_findAll];
    if (!_investments) {
        callback(nil, [NSError errorWithDomain:kDomain code:400 userInfo:nil]);
    }
    else {
        callback(_investments, nil);
    }
}

- (void)getAllInvestmentsFromUser:(User *)user callback:(void (^)(NSArray<Investment *> *investments, NSError *error))callback {
    NSArray *_investments = [Investment MR_findByAttribute:@"user" withValue:user];
    if (!_investments) {
        callback(nil, [NSError errorWithDomain:kDomain code:400 userInfo:nil]);
    }
    else {
        callback(_investments, nil);
    }
}

#pragma mark - Fetching
- (void)fetchInvestmentsWithRisk:(NSInteger)risk time:(NSInteger)time income:(NSInteger)income value:(NSInteger)value callback:(void (^)(NSArray<Investment *> *, NSError *))callback {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"risk <= %ld AND time <= %ld AND income >= %ld AND value <= %ld", risk, time, income, value];
    NSArray *_investments = [Investment MR_findAllWithPredicate:predicate];
    if (!_investments) {
        callback(nil, [NSError errorWithDomain:kDomain code:400 userInfo:nil]);
    }
    else {
        callback(_investments, nil);
    }
}

- (void)fetchInvestmentsFromUser:(User *)user withRisk:(NSInteger)risk time:(NSInteger)time income:(NSInteger)income value:(NSInteger)value callback:(void (^)(NSArray<Investment *> *, NSError *))callback {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"user == %@ AND risk <= %ld AND time <= %ld AND income >= %ld AND value <= %ld", user, risk, time, income, value];
    NSArray *_investments = [Investment MR_findAllWithPredicate:predicate];
    if (!_investments) {
        callback(nil, [NSError errorWithDomain:kDomain code:400 userInfo:nil]);
    }
    else {
        callback(_investments, nil);
    }
}

#pragma mark - Populating and Deleting
- (void)populateUsers:(void (^)(NSArray<User *> *, NSError *))callback {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        for (int_fast16_t i=1; i<=10; i++) {
            @autoreleasepool {
                NSString *name = [Helper randomName];
                User *user = [User MR_createEntityInContext:localContext];
                user.code = i;
                user.name = name;
                user.email = [[[name lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""] stringByAppendingString:@"@test.com"];
                user.thumb = [NSString stringWithFormat:@"%03d.jpg", i];
                user.rank = [Helper randomValueUntil:5];
            }
        }
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (!contextDidSave) {
            NSLog(@"%@", error);
        }
        
        callback([User MR_findAll], error);
    }];
}

- (void)deleteAllUsers:(void (^)(NSError *))callback {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        [User MR_truncateAllInContext:localContext];
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (!contextDidSave) {
            NSLog(@"%@", error);
        }
        
        callback(error);
    }];
}

- (void)populateInvestments:(void (^)(NSArray<Investment *> *, NSError *))callback {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        for (int_fast16_t i=0; i<30; i++) {
            @autoreleasepool {
                int16_t randomCode = (arc4random() % 10) + 1;
                User *user = [User MR_findFirstByAttribute:@"code" withValue:@(randomCode) inContext:localContext];
                
                Investment *investment = [Investment MR_createEntityInContext:localContext];
                investment.income = [Helper randomValueUntil:80];
                investment.risk = [Helper randomValueUntil:4];
                investment.time = [Helper randomValueUntil:60];
                investment.value = [Helper randomValueUntil:100] * 1000;
                investment.desc = @"Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Quisque volutpat augue enim, pulvinar lobortis nibh lacinia at. Vestibulum nec erat ut mi sollicitudin porttitor id sit amet risus.";
                
                investment.user = user;
                [user addInvestmentsObject:investment];
            }
        }
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (!contextDidSave) {
            NSLog(@"%@", error);
        }
        
        callback([Investment MR_findAll], error);
    }];
}

- (void)deleteAllInvestments:(void (^)(NSError *))callback {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        [Investment MR_truncateAllInContext:localContext];
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (!contextDidSave) {
            NSLog(@"%@", error);
        }
        
        callback(error);
    }];
}

@end
