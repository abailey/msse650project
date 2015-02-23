//
//  GroupVO.m
//  GroupChat
//
//  Created by Adam Bailey on 2/22/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import "GroupVO.h"

@implementation GroupVO

- (NSString *) description {
    return [NSString stringWithFormat: @"%@: %@", _name, _groupDescription];
}

@end
