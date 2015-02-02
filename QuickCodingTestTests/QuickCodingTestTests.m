//
//  QuickCodingTestTests.m
//  QuickCodingTestTests
//
//  Created by Anthony Picciano on 2/2/15.
//  Copyright (c) 2015 Anthony Picciano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "InventoryDataSource.h"

@interface QuickCodingTestTests : XCTestCase

@property (strong, nonatomic) InventoryDataSource *dataSource;

@end

@implementation QuickCodingTestTests

- (void)setUp {
    [super setUp];
    self.dataSource = [[InventoryDataSource alloc] init];
}

- (void)tearDown {
    self.dataSource = nil;
    [super tearDown];
}

- (void)testDataSource {
    NSError *error;
    NSArray *data = [self.dataSource loadData:&error];
    
    XCTAssertTrue(error == nil, @"Error returned by data source.");
    XCTAssertTrue(data != nil, @"No data was returned by data source.");
    XCTAssertTrue(data.count > 0, @"Expected amount of data was not returned.");
}

@end
