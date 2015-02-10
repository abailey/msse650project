//
//  Group.m
//  GroupChat
//
//  Created by Adam Bailey on 2/9/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import "Group.h"

@implementation Group

- (NSString *) description {
    return [NSString stringWithFormat: @"%@: %@", _name, _groupDescription];
}


@end
