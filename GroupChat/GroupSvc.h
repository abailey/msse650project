//
//  GroupSvc.h
//  GroupChat
//
//  Created by Adam Bailey on 2/9/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#ifndef GroupChat_GroupSvc_h
#define GroupChat_GroupSvc_h

#import <Foundation/Foundation.h>
#import "Group.h"
#import "GroupVO.h"

@protocol GroupSvc <NSObject>

- (Group *) createGroup: (GroupVO *) groupVO;
- (NSArray *) retrieveAllGroups;
- (Group *) updateGroup: (Group *) group;
- (Group *) deleteGroup: (Group *) group;
- (Group *) createManagedGroup;

@end

#endif
