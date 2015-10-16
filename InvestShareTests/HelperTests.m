//
//  HelperTests.m
//  InvestShare
//
//  Created by Mario Concilio on 10/16/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "Helper.h"
#import <OCMock/OCMock.h>
#import <XCTest/XCTest.h>

@interface HelperTests : XCTestCase

@end

@implementation HelperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// testa se retorna um nome e sobrenome nao nulo
- (void)testRandomName {
    NSString *name = [[Helper sharedInstance] randomName];
    XCTAssertNotNil(name, @"nome nao pode ser nulo");
    
    NSArray *array = [name componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    XCTAssertEqual(array.count, 2, @"array de nome e sobrenome deve ter 2 componentes");
}

// testa se gera um valor aleatorio menor do que o passado como parametro e maior do que zero
- (void)testRandomValue {
    NSInteger i = 100;
    NSInteger random = [[Helper sharedInstance] randomValueUntil:i];
    XCTAssertGreaterThan(random, 0, @"numero gerado deve ser maior do que zero");
    XCTAssertLessThanOrEqual(random, i, @"numero gerado deve ser menor ou igual do que i");
    
    i = 999999;
    random = [[Helper sharedInstance] randomValueUntil:i];
    XCTAssertGreaterThan(random, 0, @"numero gerado deve ser maior do que zero");
    XCTAssertLessThanOrEqual(random, i, @"numero gerado deve ser menor ou igual do que i");
}

// testa a formatacao de um int em moeda R$XXX,XX
- (void)testFormatCurrency {
    NSInteger i = 100;
    NSString *currency = [[Helper sharedInstance] formatCurrencyFromValue:i];
    XCTAssertEqualObjects(currency, @"R$100,00");
    
    i = 100000;
    currency = [[Helper sharedInstance] formatCurrencyFromValue:i];
    XCTAssertEqualObjects(currency, @"R$100.000,00");
}

// testa o tempo gerado em meses e sua formatacao
- (void)testFormatTimeFromValue {
    NSInteger months = 24;
    NSString *time = [[Helper sharedInstance] formatTimeFromValue:months];
    XCTAssertEqualObjects(time, @"2 anos");
    
    months = 10;
    time = [[Helper sharedInstance] formatTimeFromValue:months];
    XCTAssertEqualObjects(time, @"10 meses");
}

// testa se gera investimentos automaticos
- (void)testRandomInvestments {
    NSArray *investments = [[Helper sharedInstance] randomInvestments];
    XCTAssertNotNil(investments, @"erro ao gerar array de investimentos");
}

@end
