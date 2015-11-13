//
//  APIServiceTests.m
//  InvestShare
//
//  Created by Danilo Batata on 11/6/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "APIService.h"
#import "User+CoreDataProperties.h"
#import "Investment+CoreDataProperties.h"
#import <MagicalRecord/MagicalRecord.h>
#import <XCTest/XCTest.h>

@interface APIServiceTests : XCTestCase

@end

@implementation APIServiceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test00PopulateUsers {
    XCTestExpectation *expectation = [self expectationWithDescription:@"users"];

    [[APIService sharedInstance] populateUsers:^(NSArray<User *> *users, NSError *error) {
        XCTAssertNil(error);
        XCTAssertNotNil(users, @"array users nao pode ser nulo");
        XCTAssertGreaterThan(users.count, 0, @"array users nao pode ser vazio");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

- (void)test01PopulateInvestments {
    XCTestExpectation *expectation = [self expectationWithDescription:@"investments"];

    [[APIService sharedInstance] populateInvestments:^(NSArray<Investment *> *investments, NSError *error) {
        XCTAssertNil(error);
        XCTAssertNotNil(investments, @"array investments nao pode ser nulo");
        XCTAssertGreaterThan(investments.count, 0, @"array investments nao pode ser vazio");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

- (void)test02GetAllUsers {
    XCTestExpectation *expectation = [self expectationWithDescription:@"all_users"];
    
    [[APIService sharedInstance] getAllUsers:^(NSArray<User *> *users, NSError *error) {
        XCTAssertNotNil(users);
        XCTAssertNil(error);
        XCTAssertGreaterThan(users.count, 0, @"array de users nao pode estar vazio");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

- (void)test03GetAllInvestments {
    XCTestExpectation *expectation = [self expectationWithDescription:@"all_investments"];

    [[APIService sharedInstance] getAllInvestments:^(NSArray<Investment *> *investments, NSError *error) {
        XCTAssertNotNil(investments);
        XCTAssertNil(error);
        XCTAssertGreaterThan(investments.count, 0, @"array de investments nao pode estar vazio");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

- (void)test04GetAllInvestmentsFromUser {
    NSInteger random = arc4random() %10;
    User *user = [User MR_findFirstByAttribute:@"code" withValue:@(random)];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"all_investments_user"];

    [[APIService sharedInstance] getAllInvestmentsFromUser:user callback:^(NSArray<Investment *> *investments, NSError *error) {
        XCTAssertNotNil(investments);
        XCTAssertNil(error);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

- (void)test05DeleteAllUsers {
    XCTestExpectation *expectation = [self expectationWithDescription:@"delete_users"];
    
    [[APIService sharedInstance] deleteAllUsers:^(NSError *error) {
        XCTAssertNil(error);
        NSArray *users = [User MR_findAll];
        XCTAssertNotNil(users, @"array users nao pode ser nulo");
        XCTAssertEqual(users.count, 0, @"array users deve ser vazio");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

- (void)test06DeleteInvestments {
    XCTestExpectation *expectation = [self expectationWithDescription:@"delete_investments"];
    
    [[APIService sharedInstance] deleteAllInvestments:^(NSError *error) {
        XCTAssertNil(error);
        NSArray *investments = [Investment MR_findAll];
        XCTAssertNotNil(investments, @"array investments nao pode ser nulo");
        XCTAssertEqual(investments.count, 0, @"array investments deve ser vazio");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

@end
