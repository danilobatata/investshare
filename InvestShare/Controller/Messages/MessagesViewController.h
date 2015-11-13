//
//  MessagesViewController.h
//  InvestShare
//
//  Created by Danilo Batata on 11/12/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <JSQMessagesViewController/JSQMessagesViewController.h>

@class User;
@interface MessagesViewController : JSQMessagesViewController

@property (nonatomic, strong) User *user;

@end
