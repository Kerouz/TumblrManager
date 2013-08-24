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

@interface TMBViewController ()

@end

@implementation TMBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Tumblr Accounts";
    TMBAppDelegate *delegate = (TMBAppDelegate *)[[UIApplication sharedApplication]delegate];
    accounts = delegate.accounts;
    NSLog(@"Number of accounts, %lu", (unsigned long)[accounts count]);
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
    TMBAccount *thisAccount = [accounts objectAtIndex:indexpath.row];
    cell.textLabel.text = thisAccount.accountName;
    NSLog(@"%@", thisAccount.accountName);
    return cell;
}

- (NSInteger *) tableView: (UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    return [accounts count];
}

#pragma mark -
#pragma mark UITableDelegate Methods

- (void)tableView:(UITableView *)tv didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tv deselectRowAtIndexPath:indexPath animated:YES];
}

@end
