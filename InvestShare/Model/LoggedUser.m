//
//  LoggedUser.m
//  InvestShare
//
//  Created by Danilo Batata on 11/13/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "LoggedUser.h"
#import "User+CoreDataProperties.h"

#define kNameKey    @"name_key"
#define kEmailKey   @"email_key"
#define kThumbKey   @"thumb_key"
#define kCodeKey    @"code_key"
#define kRankKey    @"rank_key"

@implementation LoggedUser

- (instancetype)initWithUser:(User *)user {
    self = [super init];
    if (self) {
        _name = user.name;
        _email = user.email;
        _thumb = user.thumb;
        _code = user.code;
        _rank = user.rank;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        _name = [decoder decodeObjectForKey:kNameKey];
        _email = [decoder decodeObjectForKey:kEmailKey];
        _thumb = [decoder decodeObjectForKey:kThumbKey];
        _code = [[decoder decodeObjectForKey:kCodeKey] integerValue];
        _rank = [[decoder decodeObjectForKey:kRankKey] integerValue];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_name forKey:kNameKey];
    [encoder encodeObject:_email forKey:kEmailKey];
    [encoder encodeObject:_thumb forKey:kThumbKey];
    [encoder encodeObject:@(_code) forKey:kCodeKey];
    [encoder encodeObject:@(_rank) forKey:kRankKey];
}

@end
