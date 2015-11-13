//
//  ProfileViewController.m
//  InvestShare
//
//  Created by Danilo Batata on 11/11/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "ProfileViewController.h"
#import "Helper.h"
#import "APIService.h"
#import "AppDelegate.h"
#import "User+CoreDataProperties.h"
#import "Macros.h"
#import "MessagesViewController.h"
#import "InvestmentsViewController.h"
#import "LoggedUser.h"

#define kMessagesSegue  @"messagesSegue"
#define kFeedSegue      @"feedSegue"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *star1ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *star2ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *star3ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *star4ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *star5ImageView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.layer.cornerRadius = 50.0;
    self.imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.imageView.layer.borderWidth = 0.5;
    self.imageView.clipsToBounds = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
    if (!self.user) {
        LoggedUser *user = [Helper loggedUser];
        self.nameLabel.text = user.name;
        self.emailLabel.text = user.email;
        [self fillStarsWithRank:user.rank];
    }
    else {
        self.imageView.image = [UIImage imageNamed:self.user.thumb];
        self.nameLabel.text = self.user.name;
        self.emailLabel.text = self.user.email;
        [self fillStarsWithRank:self.user.rank];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fillStarsWithRank:(NSInteger)rank {
    UIImage *image = [UIImage imageNamed:@"star_empty"];
    switch (rank) {
        case 0:
            self.star1ImageView.image = image;
            
        case 1:
            self.star2ImageView.image = image;
            
        case 2:
            self.star3ImageView.image = image;
            
        case 3:
            self.star4ImageView.image = image;
            
        case 4:
            self.star5ImageView.image = image;
            
        default:
            break;
    }
}

- (IBAction)actionTouchUpInside:(UIBarButtonItem *)sender {
    if (!self.user) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Logout"
                                                                                 message:@"Fazer Logout?"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Logout"
                                                         style:UIAlertActionStyleDestructive
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           [NSUserDefaults setObject:nil forKey:kProfileInfo];
                                                           [UIAppDelegate defineRootViewControllerAnimated:YES];
                                                       }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancelar"
                                                               style:UIAlertActionStyleCancel
                                                             handler:NULL];
        
        [alertController addAction:action];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:NULL];
    }
    else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                                 message:nil
                                                                          preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *chatAction = [UIAlertAction actionWithTitle:@"Chat"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               [self performSegueWithIdentifier:kMessagesSegue sender:self];
                                                           }];
        UIAlertAction *listAction = [UIAlertAction actionWithTitle:@"Listar"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               [self performSegueWithIdentifier:kFeedSegue sender:self];
                                                           }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancelar"
                                                               style:UIAlertActionStyleCancel
                                                             handler:NULL];
        [alertController addAction:chatAction];
        [alertController addAction:listAction];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:NULL];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kMessagesSegue]) {
        MessagesViewController *vc = segue.destinationViewController;
        vc.user = self.user;
    }
    else if ([segue.identifier isEqualToString:kFeedSegue]) {
        InvestmentsViewController *vc = segue.destinationViewController;
        vc.user = self.user;
    }
}

@end
