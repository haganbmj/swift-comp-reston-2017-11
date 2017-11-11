//
// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
#import "MasterTableViewController.h"

// Module import for SwiftComponents framework
@import SwiftComponents;


NSString *RowNumberText(NSIndexPath *indexPath) {
    return [NSString stringWithFormat:@"Row %@", @(indexPath.row + 1)];
}


@interface MasterTableViewController ()
@end

@implementation MasterTableViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailTableViewController *controller = segue.destinationViewController;
    controller.text = RowNumberText(self.tableView.indexPathForSelectedRow);
}

@end


@implementation MasterTableViewController (DataSource)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MasterCell"];
    cell.textLabel.text = RowNumberText(indexPath);
    return cell;
}

@end
