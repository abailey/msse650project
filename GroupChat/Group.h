//
//  Group.h
//  GroupChat
//
//  Created by Adam Bailey on 2/9/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic) NSInteger *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *groupDescription;
@property (nonatomic) NSNumber *isPublic;
@property (nonatomic) NSInteger owner;


@end
