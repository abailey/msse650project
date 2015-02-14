//
//  SQLiteTests.m
//  GroupChat
//
//  Created by Adam Bailey on 2/14/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Group.h"
#import "GroupSvcSQLite.h"

@interface SQLiteTests : XCTestCase

@end

@implementation SQLiteTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGroupSvcSQLite {
    NSLog(@" ");
    NSLog(@"*** Starting testGroupSvcSQLite ***");
    
    // TODO: code for testing group service
    GroupSvcSQLite *groupSvc = [[GroupSvcSQLite alloc] init];
    Group *group = [[Group alloc] init];
    group.name = @"Test";
    group.groupDescription = @"Unit Test sample";
    group.isPublic = FALSE;
    group.owner = 1;
    [groupSvc createGroup:group];
    
    NSMutableArray *groups = [groupSvc retrieveAllGroups];
    NSLog(@"*** number of groups: %lu", (unsigned long)groups.count);
    
    group.name = @"Test Update";
    group.groupDescription = @"Unit Test sample update";
    [groupSvc updateGroup:group];
    
    [groupSvc deleteGroup:group];
    
    NSLog(@"*** Ending testGroupSvcSQLite ***");
    NSLog(@" ");
}

/*
- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
*/
@end
