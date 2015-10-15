//
//  VOInvestment.h
//  InvestShare
//
//  Created by Danilo Batata on 10/15/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface VOInvestment : NSObject

@property (nonatomic, strong) UIImage *thumb;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *income;
@property (nonatomic, copy) NSString *risk;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, copy) NSString *desc;

@end
