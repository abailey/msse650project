//
//  Group.m
//  GroupChat
//
//  Created by Adam Bailey on 2/9/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import "Group.h"

static NSString *const ID = @"id";
static NSString *const NAME = @"name";
static NSString *const GROUPDESCRIPTION = @"groupDescription";
static NSString *const ISPUBLIC = @"isPublic";
static NSString *const OWNER = @"owner";

@implementation Group

- (NSString *) description {
    return [NSString stringWithFormat: @"%@: %@", _name, _groupDescription];
}

- (void)encodeWithCoder:(NSCoder*)coder {
    [coder encodeInteger:(self.id) forKey:ID];
    [coder encodeObject:self.name forKey:NAME];
    [coder encodeObject:self.groupDescription forKey:GROUPDESCRIPTION];
    [coder encodeObject:self.isPublic forKey:ISPUBLIC];
    [coder encodeInteger:(self.owner) forKey:OWNER];
}

-(id)initWithCoder:(NSCoder *)coder{
    self = [super init];
    if (self) {
        _id = [coder decodeIntForKey:ID];
        _name = [coder decodeObjectForKey:NAME];
        _groupDescription = [coder decodeObjectForKey:GROUPDESCRIPTION];
        _isPublic = [coder decodeObjectForKey:ISPUBLIC];
        _owner = [coder decodeIntForKey:OWNER];
    }
    return self;
}

@end
