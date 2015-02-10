//
//  GroupChatTests.m
//  GroupChatTests
//
//  Created by Adam Bailey on 2/2/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Group.h"
#import "GroupSvcArchive.h"

@interface GroupChatTests : XCTestCase

@end

@implementation GroupChatTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testGroupSvcArchive {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        NSLog(@"*** Starting testGroupSvcArchive ***");
        GroupSvcArchive *groupSvc = [[GroupSvcArchive alloc] init];
        int initialCount = [[groupSvc retrieveAllGroups] count];
        
        Group *group = [[Group alloc] init];
        group.id = 1;
        group.name = @"Test";
        group.groupDescription = @"Unit test case";
        group.isPublic = [NSNumber numberWithInt:(1)];
        group.owner = 1;
        
        [groupSvc createGroup:(Group *) group];
        int finalCount = [[groupSvc retrieveAllGroups] count];
        
        XCTAssertEqual(initialCount + 1, finalCount, @"initial count %d, final count %d ", initialCount, finalCount);
        
        NSLog(@"*** Ending testGroupSvcArchive ***");
        
    }];
}

@end
