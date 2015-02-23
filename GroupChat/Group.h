//
//  Group.h
//  GroupChat
//
//  Created by Adam Bailey on 2/21/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Group : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * groupDescription;
@property (nonatomic, retain) NSNumber * isPublic;
@property (nonatomic, retain) NSNumber * owner;

@end
