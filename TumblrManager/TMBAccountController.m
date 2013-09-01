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
    
    currentAccount = [delegate.results objectAtIndex:index.row ];
    self.title = currentAccount.accountName;
    
        
    // Checking that the currently selected account is correct!!
//    NSLog(@"current account name %@", currentAccount.accountName);
//    NSLog(@"First followed blog: %@", [currentAccount.accountBlogs  objectAtIndex:0]);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDataSource Methods

- (UITableViewCell *) tableView: (UITableView *)tv cellForRowAtIndexPath: (NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
//    TMBBlog *listFollowedBlog = [currentAccount.accountBlogs objectAtIndex:indexPath.row];
    NSString *tempString = @"TEMP";
    cell.textLabel.text = tempString;
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int tempInt = 3;
    return tempInt;
}

#pragma mark -
#pragma mark UITableDelegate Methods

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TMBAppDelegate *delegate = (TMBAppDelegate *) [[UIApplication sharedApplication] delegate];
//    TMBBlogController *selectedBlog = [[TMBBlogController alloc] initWithIndexPath:indexPath];
//    [delegate.navController pushViewController:selectedBlog animated:YES];
    [tv deselectRowAtIndexPath:indexPath animated:YES];
}


@end
