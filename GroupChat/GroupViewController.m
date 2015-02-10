//
//  GroupViewController.m
//  GroupChat
//
//  Created by Adam Bailey on 2/10/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import "GroupViewController.h"
#import "Group.h"
//#import "GroupSvcCache.h"
#import "GroupSvcArchive.h"

@interface GroupViewController ()

@end

@implementation GroupViewController

//GroupSvcCache *groupSvc = nil;
GroupSvcArchive *groupSvc = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (groupSvc == nil) {
        groupSvc = [[GroupSvcArchive alloc] init];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveGroup:(Group*)group {
    NSLog(@"GroupViewController.saveGroup entering");
    
    [self.view endEditing:YES];
    
    [groupSvc createGroup: group];
    NSLog(@"GroupViewController.saveGroup: group saved");
}

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [[groupSvc retrieveAllGroups] count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Group *group = [[groupSvc retrieveAllGroups] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = group.name;
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
