//
//  GroupViewController.m
//  GroupChat
//
//  Created by Adam Bailey on 2/10/15.
//  Copyright (c) 2015 Adam Bailey. All rights reserved.
//

#import "GroupViewController.h"
//#import "GroupSvcCache.h"
//#import "GroupSvcArchive.h"
//#import "GroupSvcSQLite.h"
#import "GroupSvcCoreData.h"
#import "GroupMessagesController.h"

@interface GroupViewController ()

@end

@implementation GroupViewController

//GroupSvcCache *groupSvc = nil;
//GroupSvcArchive *groupSvc = nil;
//GroupSvcSQLite *groupSvc = nil;
GroupSvcCoreData *groupSvc = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (groupSvc == nil) {
        groupSvc = [[GroupSvcCoreData alloc] init];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveGroup:(GroupVO*)groupVO {
    NSLog(@"GroupViewController.saveGroup entering");
    
    [self.view endEditing:YES];
    
    [groupSvc createGroup: groupVO];
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

//when blue accessory button has been pressed
/*
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"accessoryButtonTappedForRowWithIndexPath");
    //turn into edit mode
    [tableView setEditing:YES animated:YES];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
}
 */

// Respond to a table cell item being selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath Start");
    //[tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    GroupMessagesController *groupMessagesController = [storyboard instantiateViewControllerWithIdentifier:@"GroupMessagesController"];
    //groupMessagesController.selectedGroup = [[groupSvc retrieveAllGroups] objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:groupMessagesController animated:YES];
    NSLog(@"didSelectRowAtIndexPath End");
}

// method to enable the deleting of rows
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"commitEditingStyle");
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Group *group = [[groupSvc retrieveAllGroups] objectAtIndex:indexPath.row];
        
        [groupSvc deleteGroup:group];
        
        [tableView setEditing:NO animated:YES];
        
        // refresh the table view
        [tableView reloadData];
    }
    
}

@end
