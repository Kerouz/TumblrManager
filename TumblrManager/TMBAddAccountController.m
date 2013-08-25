//
//  TMBAddAccountController.m
//  TumblrManager
//
//  Created by Andie Le Quiniat on 25/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import "TMBAddAccountController.h"
#import "TMBViewController.h"
#import "TMBAccount.h"
#import "TMBAppDelegate.h"

@interface TMBAddAccountController ()

@end

@implementation TMBAddAccountController

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAccount:)];
    self.title = @"Add Account";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)emailAddress:(id)sender {
}

- (IBAction)accountPassword:(id)sender {
}


- (void) saveAccount: (id)sender {
    
    TMBAppDelegate *delegate = (TMBAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSMutableArray *accounts = delegate.accounts;
    
    // Need to get rid of the viewWithTag
    UITextField *userEmailAddress =  _emailAddress;
    UITextField *userPassword = _accountPassword;
    
//    if (userEmailAddress.text.length >= 0) {
        TMBAccount *newAccount = [[TMBAccount alloc] initWithDetails:userEmailAddress.text];
    [accounts addObject:newAccount];
//        NSLog(@"Pressing button");
        TMBViewController *viewController = delegate.viewController;
        [viewController.tableView reloadData];
    // Checking that the number of accounts is increasing
        NSLog(@"Last account: %lu", (unsigned long)accounts.count );
//    }
    [delegate.navController popViewControllerAnimated:YES];
}


// CHRIS!! HOW AM I SUPPOSED TO USE THIS? IS IT NECESSARY?
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.emailAddress) {
        [theTextField resignFirstResponder];
    }
    return YES; }

@end
