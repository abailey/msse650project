//
//  GroupSvcCache.m
//  GroupChat
//
//  Created by Adam Bailey on 2/9/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import "GroupSvcCache.h"

@implementation GroupSvcCache

NSMutableArray *groups = nil;

- (id) init {
    if (self = [super init]) {
        groups = [NSMutableArray array];
        return self;
    }
    return nil;
}

- (Group *) createGroup: (Group *) group {
    [groups addObject: group];
    return group;
}

- (NSMutableArray *) retrieveAllGroups {
    return groups;
}

- (Group *) updateGroup: (Group *) group {
    return group;
}

- (Group *) deleteGroup: (Group *) group {
    return group;
}

@end
