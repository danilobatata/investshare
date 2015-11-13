//
//  ListUsersViewController.m
//  InvestShare
//
//  Created by Danilo Batata on 11/6/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "ListUsersViewController.h"
#import "User+CoreDataProperties.h"
#import "UserCell.h"
#import "APIService.h"
#import "ProfileViewController.h"

#define kProfileSegue @"profileSegue"

@interface ListUsersViewController () <UISearchResultsUpdating>

@property (nonatomic, strong) NSArray<User *> *users;
@property (nonatomic, strong) NSArray<User *> *searchResults;
@property (nonatomic, strong) UISearchController *searchController;

@end

static NSString *const reuseIdentifier = @"Cell";

@implementation ListUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchController.searchBar.barStyle = UIBarStyleDefault;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.definesPresentationContext = YES;
    [self.searchController.searchBar sizeToFit];
    self.navigationItem.titleView = self.searchController.searchBar;
    
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[APIService sharedInstance] getAllUsers:^(NSArray<User *> *users, NSError *error) {
        if (!error) {
            self.users = users;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kProfileSegue]) {
        ProfileViewController *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        vc.user = self.users[indexPath.row];
    }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.searchController isActive]) {
        return self.searchResults.count;
    }
    
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    User *user;
    if ([self.searchController isActive]) {
        user = self.searchResults[indexPath.row];
    }
    else {
        user = self.users[indexPath.row];
    }
    
    cell.user = user;
    
    return cell;
}

#pragma mark - Search Results Updating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    self.searchResults = nil;
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchController.searchBar.text];
    self.searchResults = [self.users filteredArrayUsingPredicate:resultPredicate];
    
    [self.tableView reloadData];
}

@end
