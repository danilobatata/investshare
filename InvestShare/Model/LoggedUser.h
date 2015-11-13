//
//  LoggedUser.h
//  InvestShare
//
//  Created by Danilo Batata on 11/13/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@interface LoggedUser : NSObject

@property (nonnull, nonatomic, copy) NSString *email;
@property (nonnull, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t rank;
@property (nonnull, nonatomic, copy) NSString *thumb;
@property (nonatomic) int16_t code;

- (_Nullable instancetype)initWithUser:(User * _Nonnull)user;

@end
