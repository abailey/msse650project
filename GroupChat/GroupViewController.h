//
//  GroupViewController.h
//  GroupChat
//
//  Created by Adam Bailey on 2/10/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupVO.h"
//#import "GroupSvcCache.h"

@interface GroupViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (strong) GroupSvcCache *groupSvc;
- (void)saveGroup:(GroupVO *)groupVO;
@end
