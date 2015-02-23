//
//  GroupManageController.m
//  GroupChat
//
//  Created by Adam Bailey on 2/10/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import "GroupManageController.h"
#import "GroupViewController.h"

#import "GroupVO.h"

@interface GroupManageController ()

@end

@implementation GroupManageController

GroupVO *groupVO = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    groupVO = [[GroupVO alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveGroup:(id)sender {
    NSLog(@"GroupManageController.saveGroup entering");
    
    [self.view endEditing:YES];
    
    //[groupSvc createGroup: group];
    NSLog(@"GroupManageController.saveGroup exiting");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"GroupManageSaveGroupSegue"]){
        NSLog(@"GroupManageController.prepareForSeque");
        GroupViewController *gvc = (GroupViewController *) segue.destinationViewController;

        groupVO.name = _name.text;
        groupVO.groupDescription = _groupDescription.text;
        groupVO.isPublic = [NSNumber numberWithBool:_isPublic.on];
        groupVO.owner = [NSNumber numberWithInt:_owner.text.integerValue];

        NSLog(@"Passing group: %@\n",groupVO.name);
        [gvc saveGroup:(GroupVO*)groupVO];
        NSLog(@"GroupManageController.saveGroup: group saved");
    }
}

@end
