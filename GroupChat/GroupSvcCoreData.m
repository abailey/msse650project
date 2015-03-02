//
//  GroupSvcCoreData.m
//  GroupChat
//
//  Created by Adam Bailey on 2/21/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import "GroupSvcCoreData.h"
#import <CoreData/CoreData.h>

@implementation GroupSvcCoreData

NSManagedObjectModel *model = nil;
NSPersistentStoreCoordinator *psc = nil;
NSManagedObjectContext *moc = nil;

- (id) init {
    if (self = [super init]) {
        [self initializeCoreData];
        return self;
    }
    return nil;
}

- (void) initializeCoreData {
    // initialize (load) the schema model
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    // initialize the persistent store coordinator with the model
    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"ContactsMgr.sqlite"];
    NSError *error = nil;
    psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    if ([psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // initialize the managed object context
        moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [moc setPersistentStoreCoordinator:psc];
    } else {
        NSLog(@"initializeCoreData FAILED with error: %@", error);
    }
    
    
}

- (Group *) createManagedGroup {
    Group *group = [NSEntityDescription insertNewObjectForEntityForName:@"Group" inManagedObjectContext:moc];
    return group;
}

- (Group *) createGroup:(GroupVO *)groupVO {
    Group *managedGroup = [self createManagedGroup];
    managedGroup.id = groupVO.id;
    managedGroup.name = groupVO.name;
    managedGroup.groupDescription = groupVO.groupDescription;
    managedGroup.isPublic = groupVO.isPublic;
    managedGroup.owner = groupVO.owner;
    NSError *error;
    if (![moc save:&error]) {
        NSLog(@"createGroup ERROR: %@", [error localizedDescription]);
    }
    return managedGroup;
}

- (NSArray *) retrieveAllGroups {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Group" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    NSError *error;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}

- (Group *) updateGroup:(Group *)group {
    NSError *error;
    if (![moc save:&error]) {
        NSLog(@"updateContact ERROR: %@", [error localizedDescription]);
    }
    return group;
}

- (Group *) deleteGroup:(Group *)group {
    [moc deleteObject:group];
    NSError *error;
    if (![moc save:&error]) {
        NSLog(@"updateContact ERROR: %@", [error localizedDescription]);
    }
    return group;
}

@end
