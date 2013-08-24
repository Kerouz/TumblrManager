//
//  TMBAccountController.m
//  TumblrManager
//
//  Created by Andie Le Quiniat on 24/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import "TMBAccountController.h"
#import "TMBAppDelegate.h"
#import "TMBAccount.h"

@interface TMBAccountController ()

@end

@implementation TMBAccountController

- (id)initWithIndexPath:(NSIndexPath *)indexPath {
    if ((self = [super init])) {
        index = indexPath;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    TMBAppDelegate *delegate = (TMBAppDelegate *)[[UIApplication sharedApplication] delegate];
    TMBAccount *thisAccount = [delegate.accounts objectAtIndex:index.row ];
    self.title = thisAccount.accountName;
    
    followedBlog.text = thisAccount.accountName;
    // Checking that the currently selected account is correct!!
    //    NSLog(@"current account name %@", thisAccount.accountName);
    followedBlog.editable = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Delegate Methods

- (UITableViewCell *) tableView: (UITableView *)tv cellForRowAtIndexPath: (NSIndexPath *)indexpath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    currentAccount = [accounts objectAtIndex:indexpath.row];
    cell.textLabel.text = thisAccount.accountName;
    NSLog(@"%@", thisAccount.accountName);
    return cell;
}


@end
