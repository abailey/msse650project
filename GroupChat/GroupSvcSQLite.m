//
//  GroupSvcSQLite.m
//  GroupChat
//
//  Created by Adam Bailey on 2/10/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import "GroupSvcSQLite.h"

#import "sqlite3.h"

@implementation GroupSvcSQLite

NSString *databasePath = nil;
sqlite3 *database = nil;

- (id)init {
    if ((self = [super init])) {
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [documentPaths objectAtIndex:0];
        databasePath = [documentsDir stringByAppendingPathComponent:@"groupchat.sqlite3"];
        
        if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            NSLog(@"database is open");
            NSLog(@"database file path: %@", databasePath);
            
            NSString *createSQL = @"CREATE TABLE group_ (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR (30), groupDescription VARCHAR (128), isPublic INTEGER, owner INTEGER)";
            char *errMsg;
            if (sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, &errMsg) != SQLITE_OK ) {
                NSLog(@"Failed to create table %s", errMsg);
            }
        } else {
            NSLog(@"*** Failed to open database!");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
    }
    return self;
}

- (Group*)createGroup:(Group *)group{
    sqlite3_stmt *statement;
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO group_ (name, groupDescription, isPublic, owner) VALUES(\"%@\", \"%@\", \"%@\", \"%ld\")",group.name, group.groupDescription, group.isPublic, (long)group.owner ];
    if (sqlite3_prepare_v2(database, [insertSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            group.id = sqlite3_last_insert_rowid(database);
            NSLog(@"*** Contact added");
        } else {
            NSLog(@"*** Contact NOT added");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return group;
}

- (NSMutableArray*) retrieveAllGroups {
    NSMutableArray *groups = [NSMutableArray array];
    NSString *selectSQL = [NSString stringWithFormat:@"SELECT * FROM group_ ORDER BY name"];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        NSLog(@"*** Contacts retrieved");
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int id = sqlite3_column_int(statement, 0);
            char *nameChars = (char *)sqlite3_column_text(statement, 1);
            char *groupDescriptionChars = (char *)sqlite3_column_text(statement, 2);
            int isPublicInt = sqlite3_column_int(statement, 3);
            int ownerInt = sqlite3_column_int(statement, 4);
            
            Group *group = [[Group alloc] init];
            group.id = id;
            group.name = [[NSString alloc] initWithUTF8String:nameChars];
            group.groupDescription  = [[NSString alloc] initWithUTF8String:groupDescriptionChars];
            group.isPublic = [[NSNumber alloc] initWithInt:isPublicInt];
            group.owner = ownerInt;
            [groups addObject:group];
        }
        sqlite3_finalize(statement);
    } else {
        NSLog(@"*** Contacts NOT retrieved");
        NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
    }
    return groups;
}

- (Group*) updateGroup:(Group *)group {
    NSString *updateSQL = [NSString stringWithFormat:@"UPDATE group_ SET name=\"%@\", groupDescription=\"%@\", isPublic=\"%@\", owner=\"%ld\" WHERE id = %li ", group.name, group.groupDescription, group.isPublic, group.owner, (long)group.id];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, NULL) == SQLITE_OK ) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"*** Contact updated");
        } else {
            NSLog(@"*** Contact NOT updated");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return group;
}

- (Group*) deleteGroup:(Group *)group {
    NSString *deleteSQL = [NSString stringWithFormat:@"DELETE FROM group_ WHERE id = %li ", (long)group.id];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [deleteSQL UTF8String], -1, &statement, NULL) == SQLITE_OK ) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"*** Contact deleted");
        } else {
            NSLog(@"*** Contact NOT deleted");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return group;
}

- (void)dealloc {
    sqlite3_close(database);
}

@end
