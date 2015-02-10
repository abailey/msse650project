//
//  GroupManageController.h
//  GroupChat
//
//  Created by Adam Bailey on 2/10/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupManageController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *groupDescription;
@property (weak, nonatomic) IBOutlet UISwitch *isPublic;
@property (weak, nonatomic) IBOutlet UITextField *owner;
- (IBAction)saveGroup:(id)sender;

@end
