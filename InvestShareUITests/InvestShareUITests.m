//
//  InvestShareUITests.m
//  InvestShareUITests
//

//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface InvestShareUITests : XCTestCase

@end

@implementation InvestShareUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCellDetailSegue {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *table = app.tables[@"table"];
    [[table.cells containingType:XCUIElementTypeStaticText identifier:@"Fernanda Gomes"].staticTexts[@"Risco B"] tap];
    [app.navigationBars[@"Fernanda Gomes"].buttons[@"Feed"] tap];
    [app.navigationBars[@"Luiz Morais"].buttons[@"Feed"] tap];
    [[table.cells containingType:XCUIElementTypeStaticText identifier:@"Maria Martins"].staticTexts[@"Risco A"] swipeUp];
    [app.navigationBars[@"Leonardo Alves"].buttons[@"Feed"] tap];
    
}

@end
