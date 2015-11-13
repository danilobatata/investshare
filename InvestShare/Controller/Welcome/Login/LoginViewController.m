//
//  LoginViewController.m
//  InvestShare
//
//  Created by Danilo Batata on 11/5/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "LoginViewController.h"
#import "APIService.h"

#define kMainSegue      @"mainSegue"
#define kAlertPreencha  @"Por favor preencha todos os campos"
#define kAlertPassword  @"Email/Senha incorretos"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneTouchUpInside:(UIBarButtonItem *)sender {
    if (self.emailTextField.text.length == 0 ||
        self.passwordTextField.text.length == 0) {
        [self showErrorWithMessage:kAlertPreencha];
        return;
    }
    
    [[APIService sharedInstance] login:self.emailTextField.text password:self.passwordTextField.text callback:^(NSError *error) {
        if (error) {
            [self showErrorWithMessage:kAlertPassword];
        }
        else {
            [self performSegueWithIdentifier:kMainSegue sender:self];
        }
    }];
}

- (void)showErrorWithMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Atenção"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleCancel
                                                   handler:NULL];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:NULL];
}

@end
