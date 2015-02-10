//
//  GroupManageController.m
//  GroupChat
//
//  Created by Adam Bailey on 2/10/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import "GroupManageController.h"
#import "GroupViewController.h"

#import "Group.h"

@interface GroupManageController ()

@end

@implementation GroupManageController

Group *group = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    group = [[Group alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveGroup:(id)sender {
    NSLog(@"GroupManageController.saveGroupL entering");
    
    [self.view endEditing:YES];
    
    group.name = _name.text;
    group.groupDescription = _groupDescription.text;
    group.isPublic = [NSNumber numberWithBool:_isPublic.on];
    group.owner = _owner.text.integerValue;
    //[groupSvc createGroup: group];
    NSLog(@"GroupManageController.saveGroup: group saved");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"GroupManageSaveGroupSegue"]){
        GroupViewController *gvc = (GroupViewController *) segue.destinationViewController;
        [gvc saveGroup:(Group*)group];
    }
}

@end
