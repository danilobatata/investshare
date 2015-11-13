//
//  InvestmentsViewController.m
//  InvestShare
//
//  Created by Danilo Batata on 10/15/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "Helper.h"
#import "Macros.h"
#import "InvestmentsViewController.h"
#import "InvestmentCell.h"
#import "DetailInvestViewController.h"
#import "Investment.h"
#import "SuitabilityViewController.h"
#import "APIService.h"

#define kDetailSegue        @"detailSegue"
#define kSuitabilitySegue   @"suitabilitySegue"

@interface InvestmentsViewController () <SuitabilityDelegate>

@property (nonatomic, strong) NSArray<Investment *> *investments;

@end

static NSString *const CellID = @"CellID";

@implementation InvestmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = UIColorFromRGB(240, 240, 240);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.accessibilityIdentifier = @"table";
    self.tableView.userInteractionEnabled = YES;
    
    self.navigationItem.title = @"Feed";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [self getAllInvestments];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getAllInvestments {
    if (self.user) {
        [[APIService sharedInstance] getAllInvestmentsFromUser:self.user callback:^(NSArray<Investment *> *investments, NSError *error) {
            if (!error) {
                self.investments = investments;
            }
            else {
                self.investments = [[NSArray alloc] init];
            }
        }];
    }
    else {
        [[APIService sharedInstance] getAllInvestments:^(NSArray<Investment *> *investments, NSError *error) {
            if (!error) {
                self.investments = investments;
            }
            else {
                self.investments = [[NSArray alloc] init];
            }
        }];
    }
    
    [self.tableView reloadData];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kDetailSegue]) {
        DetailInvestViewController *vc = segue.destinationViewController;
        
//        VOInvestment *investment = self.investments[[sender intValue]];
//        vc.investment = investment;
    }
    else if ([segue.identifier isEqualToString:kSuitabilitySegue]) {
        UINavigationController *nav = segue.destinationViewController;
        SuitabilityViewController *vc = (id)nav.childViewControllers[0];
        vc.delegate = self;
    }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.investments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InvestmentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    Investment *investment = self.investments[indexPath.row];
    [cell setInvestment:investment];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - Suitability Delegate
- (void)suitabilityDidCancel {
    [self getAllInvestments];
}

- (void)suitabilityDidDismissWithRisk:(NSInteger)risk time:(NSInteger)time income:(NSInteger)income value:(NSInteger)value {
    if (self.user) {
        [[APIService sharedInstance] fetchInvestmentsFromUser:self.user withRisk:risk time:time income:income value:value callback:^(NSArray<Investment *> *investments, NSError *error) {
            if (!error) {
                self.investments = investments;
            }
            else {
                self.investments = investments;
            }
            
            [self.tableView reloadData];
        }];
    }
    else {
        [[APIService sharedInstance] fetchInvestmentsWithRisk:risk time:time income:income value:value callback:^(NSArray<Investment *> *investments, NSError *error) {
            if (!error) {
                self.investments = investments;
            }
            else {
                self.investments = investments;
            }
            
            [self.tableView reloadData];
        }];
    }
}

@end
