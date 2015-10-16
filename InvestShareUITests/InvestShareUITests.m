//
//  InvestShareUITests.m
//  InvestShareUITests
//
//  Created by Danilo Batata on 10/16/15.
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
    // inicia app
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *table = app.tables[@"table"];
    
    // pega a primeira cell
    XCUIElement *firstCell = [table.cells elementBoundByIndex:0];
    NSString *cellTitle = [[firstCell.staticTexts elementMatchingType:XCUIElementTypeStaticText identifier:@"nameLabel"] label];
    [firstCell tap];
    
    // confere se o titulo da view eh o mesmo da cell
    NSString *viewTitle = [[app.navigationBars.staticTexts elementBoundByIndex:0] label];
    XCTAssertEqualObjects(cellTitle, viewTitle, @"o titulo da view difere do titulo da cell");
    
    // retorna para tableview
    [app.navigationBars.buttons[@"Back"] tap];
    
    // confere se voltou pra tela anterior de Feed
    viewTitle = [[app.navigationBars.staticTexts elementBoundByIndex:0] label];
    XCTAssertEqualObjects(viewTitle, @"Feed", @"nao voltou para a tableview inicial");
    
    // pega a terceira cell
    XCUIElement *thirdCell = [table.cells elementBoundByIndex:2];
    cellTitle = [[thirdCell.staticTexts elementMatchingType:XCUIElementTypeStaticText identifier:@"nameLabel"] label];
    [thirdCell tap];
    
    // confere se o titulo da view eh o mesmo da cell
    viewTitle = [[app.navigationBars.staticTexts elementBoundByIndex:0] label];
    XCTAssertEqualObjects(cellTitle, viewTitle, @"o titulo da view difere do titulo da cell");
    
    // retorna para tableview
    [app.navigationBars.buttons[@"Back"] tap];
    
    // confere se voltou pra tela anterior de Feed
    viewTitle = [[app.navigationBars.staticTexts elementBoundByIndex:0] label];
    XCTAssertEqualObjects(viewTitle, @"Feed", @"nao voltou para a tableview inicial");
    
    [table swipeUp];

    // pega a quinta cell
    XCUIElement *fifithCell = [table.cells elementBoundByIndex:4];
    cellTitle = [[fifithCell.staticTexts elementMatchingType:XCUIElementTypeStaticText identifier:@"nameLabel"] label];
    [fifithCell tap];
    
    // confere se o titulo da view eh o mesmo da cell
    viewTitle = [[app.navigationBars.staticTexts elementBoundByIndex:0] label];
    XCTAssertEqualObjects(cellTitle, viewTitle, @"o titulo da view difere do titulo da cell");
    
    // retorna para tableview
    [app.navigationBars.buttons[@"Back"] tap];
    
    // confere se voltou pra tela anterior de Feed
    viewTitle = [[app.navigationBars.staticTexts elementBoundByIndex:0] label];
    XCTAssertEqualObjects(viewTitle, @"Feed", @"nao voltou para a tableview inicial");
}

@end
