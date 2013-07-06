//
//  ViewController.m
//  TableView5.3.1
//
//  Created by yons on 13-7-6.
//  Copyright (c) 2013年 com.style. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSDictionary *listTeams;
    NSArray *listGroupName;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *listTeamsPath = [[NSBundle mainBundle] pathForResource:@"team_dictionary" ofType:@"plist"];
    listTeams = [NSDictionary dictionaryWithContentsOfFile:listTeamsPath];
    
    NSArray *groupName = [listTeams allKeys];
    listGroupName = [groupName sortedArrayUsingSelector:@selector(compare:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[listTeams valueForKey:[listGroupName objectAtIndex:section]] count];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [listGroupName count];
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [listGroupName objectAtIndex:section];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIndentifier = @"cellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    
    cell.textLabel.text = [[listTeams valueForKey:[listGroupName objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *listTitle = [NSMutableArray arrayWithCapacity:[listGroupName count]];
    for (NSString *title in listGroupName) {
        [listTitle addObject:[title substringToIndex:1]];
    }
    return listTitle;
}

@end
