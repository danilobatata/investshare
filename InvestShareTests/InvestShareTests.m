//
//  InvestShareTests.m
//  InvestShareTests
//
//  Created by Danilo Batata on 10/15/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "VOInvestment.h"
#import "InvestmentsViewController.h"

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import <KIF/KIF.h>

@interface InvestShareTests : KIFTestCase

@end

@implementation InvestShareTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test00firstRow {
    // pego view controller atual
    UINavigationController *nav = (UINavigationController *) [UIApplication sharedApplication].keyWindow.rootViewController;
    InvestmentsViewController *vc = nav.childViewControllers[0];
    
    // investimento selecionado
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [tester tapRowAtIndexPath:indexPath inTableViewWithAccessibilityIdentifier:@"table"];
    VOInvestment *investment = vc.investments[indexPath.row];
    
    // nome esperado do investimento
    NSString *expectedName = investment.name;
    
    // espero o nome
    [tester waitForViewWithAccessibilityLabel:expectedName];
    
    // clica em voltar
    [tester tapViewWithAccessibilityLabel:@"Back"];
    
    // espera a tela inicial
    [tester waitForViewWithAccessibilityLabel:@"Feed"];
}

- (void)test01secondRow {
    UINavigationController *nav = (UINavigationController *) [UIApplication sharedApplication].keyWindow.rootViewController;
    InvestmentsViewController *vc = nav.childViewControllers[0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    [tester tapRowAtIndexPath:indexPath inTableViewWithAccessibilityIdentifier:@"table"];
    VOInvestment *investment = vc.investments[indexPath.row];
    NSString *expectedName = investment.name;
    
    [tester waitForViewWithAccessibilityLabel:expectedName];
    
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForViewWithAccessibilityLabel:@"Feed"];
}

- (void)test02thirdRow {
    UINavigationController *nav = (UINavigationController *) [UIApplication sharedApplication].keyWindow.rootViewController;
    InvestmentsViewController *vc = nav.childViewControllers[0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
    [tester tapRowAtIndexPath:indexPath inTableViewWithAccessibilityIdentifier:@"table"];
    VOInvestment *investment = vc.investments[indexPath.row];
    NSString *expectedName = investment.name;
    
    [tester waitForViewWithAccessibilityLabel:expectedName];
    
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForViewWithAccessibilityLabel:@"Feed"];
}

@end
