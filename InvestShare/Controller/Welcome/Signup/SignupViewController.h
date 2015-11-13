//
//  SignupViewController.h
//  InvestShare
//
//  Created by Danilo Batata on 11/5/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmTextField;

- (IBAction)doneTouchUpInside:(UIBarButtonItem *)sender;

@end
