//
//  GroupVO.h
//  GroupChat
//
//  Created by Adam Bailey on 2/22/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//
// This is a Group Value Object (VO) to facilitate passing between selectors

#import <Foundation/Foundation.h>

@interface GroupVO : NSObject

@property (nonatomic) NSNumber * id;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * groupDescription;
@property (nonatomic) NSNumber * isPublic;
@property (nonatomic) NSNumber * owner;

@end
