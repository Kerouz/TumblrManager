//
//  TMBViewController.m
//  TumblrManager
//
//  Created by Andie Le Quiniat on 24/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import "TMBViewController.h"
#import "TMBAccountController.h"
#import "TMBAppDelegate.h"
#import "TMBAccount.h"
#import "TMBAddAccountController.h"

@interface TMBViewController ()

@end

@implementation TMBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Tumblr Accounts";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    TMBAppDelegate *delegate = (TMBAppDelegate *)[[UIApplication sharedApplication]delegate];
    accounts = delegate.accounts;
    // NSLog(@"Number of accounts, %lu", (unsigned long)[accounts count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDataSource Methods


- (UITableViewCell *) tableView: (UITableView *)tv cellForRowAtIndexPath: (NSIndexPath *)indexpath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if (indexpath.row < accounts.count) {
    TMBAccount *thisAccount = [accounts objectAtIndex:indexpath.row];
    cell.textLabel.text = thisAccount.accountName;
    } else {
        cell.textLabel.text = @"Add a tumblr account";
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    // Checks for the current account and whether there is a blog followed
//    NSLog(@"%@", thisAccount.accountName);
//    NSLog(@"second blog followed: %@", [thisAccount.accountBlogs objectAtIndex:1] );
    return cell;
}

- (NSInteger *) tableView: (UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    NSInteger count = accounts.count;
    if (self.editing) {
        count = count +1;
    }
    return count;
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (editing != self.editing) {
        [super setEditing:editing animated:animated];
        [self.tableView setEditing:editing animated:animated];
        
        NSMutableArray *indices = [[NSMutableArray alloc] init];
        for (int i=0; i < accounts.count; i++) {
            [indices addObject: [ NSIndexPath indexPathForRow:i inSection:0]];
        }
        NSArray *lastIndex = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:accounts.count inSection:0]];
        
        if (editing == YES) {
            for (int i=0; i < accounts.count; i++) {
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[indices objectAtIndex:i]];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            [self.tableView insertRowsAtIndexPaths:lastIndex withRowAnimation:UITableViewRowAnimationLeft];
        }else {
            for (int i=0; i < accounts.count; i++) {
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[indices objectAtIndex:i]];
                [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
            }
            [self.tableView deleteRowsAtIndexPaths:lastIndex withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
}


- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle) editing forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editing == UITableViewCellEditingStyleDelete) {
        [accounts removeObjectAtIndex:indexPath.row];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}


#pragma mark -
#pragma mark UITableDelegate Methods

- (void)tableView:(UITableView *)tv didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    TMBAppDelegate *delegate = (TMBAppDelegate *) [[UIApplication sharedApplication] delegate];
    
    if (indexPath.row < accounts.count && !self.editing) {
        TMBAccountController *accountList = [[TMBAccountController alloc] initWithIndexPath:indexPath];
        [delegate.navController pushViewController:accountList animated:YES];
    }
    if (indexPath.row == accounts.count && self.editing) {
        TMBAddAccountController *addAccount = [[TMBAddAccountController alloc] init];        
        [delegate.navController pushViewController:addAccount animated:YES];
    }
    [tv deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tv editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < accounts.count) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
}

@end
