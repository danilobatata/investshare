//
//  User.m
//  InvestShare
//
//  Created by Danilo Batata on 11/6/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "User.h"
#import "Investment.h"
#import <SSKeychain.h>

@implementation User

static NSString *const SERVICE = @"com.danilobatata.InvestShare";

- (NSString *)password {
    if (self.email) {
        return [SSKeychain passwordForService:SERVICE account:self.email];
    }
    
    return nil;
}

- (void)setPassword:(NSString *)password {
    if (self.email) {
        [SSKeychain setPassword:password forService:SERVICE account:self.email];
    }
}

- (void)prepareForDeletion {
    if (self.email) {
        [SSKeychain deletePasswordForService:SERVICE account:self.email];
    }
}

@end
