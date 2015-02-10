//
//  GroupSvcArchive.m
//  GroupChat
//
//  Created by Adam Bailey on 2/10/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import "GroupSvcArchive.h"

@implementation GroupSvcArchive

NSString *filePath;

NSMutableArray *groups;

- (id) init {
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    filePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"Groups.archive"]];
    [self readArchive];
    return self;
}

- (void) readArchive {
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath:filePath]) {
        groups = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    } else {
        groups = [NSMutableArray array];
    }
}

- (void) writeArchive {
    [NSKeyedArchiver archiveRootObject:groups toFile:filePath];
}

- (Group *)createGroup:(Group *)group{
    
    NSLog(@"GroupSvcArchive.createGroup: %@", [group name]);
    
    [groups addObject:group];
    [self writeArchive];
    
    return group;
}

- (NSMutableArray*) retrieveAllGroups{
    return groups;
}

- (Group *) updateGroup:(Group*) group {
    return group;
}

- (Group *) deleteGroup:(Group *)group {
    return group;
}

@end
