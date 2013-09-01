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
#import "TwitterAppViewController.h"

@interface TMBViewController ()

@end

@implementation TMBViewController


- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title= @"Test Accounts";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.title = @"Followed Accounts";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    delegate = (TMBAppDelegate *)[[UIApplication sharedApplication]delegate];
    [delegate getFollowed];

    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshEvents) forControlEvents:UIControlEventValueChanged];
    
    //    This is returning NULL
    NSLog (@"Did get from Delegate? %@", results);

}


#pragma mark - Actions

- (void)refreshEvents
{
    [self.repository fetchVenues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDataSource Methods

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // This line returns the ID of the current user's friends
//    cell.textLabel.text = [NSString stringWithFormat:@"%@", results [[indexPath row]]];
    
    cell.textLabel.text = @"TEMP";
    return cell;
}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    results = delegate.results;

//    return results.count;
    int count = (int)5;
    NSLog(@"results.count: %d", results.count);
    return count;

}


#pragma mark -
#pragma mark UITableDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 //   TMBAppDelegate *delegate = (TMBAppDelegate *) [[UIApplication sharedApplication] delegate];
    
    if (indexPath.row < results.count && !self.editing) {
//        TMBAccountController *accountList = [[TMBAccountController alloc] initWithIndexPath:indexPath];
        TwitterAppViewController *accountList = [[TwitterAppViewController alloc] init];

        [delegate.navController pushViewController:accountList animated:YES];
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



//- (void) getFollowed {
//    ACAccountStore *account = [[ACAccountStore alloc] init];
//    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
//    
//    [account requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
//     {
//         if (granted)
//         {
//             NSArray *arrayOfAccounts = [account accountsWithAccountType:accountType];
//             
//             if ([arrayOfAccounts count] > 0)
//             {
//                 ACAccount *twitterAccount = [arrayOfAccounts lastObject];
//                 
//                 NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/friends/ids.json"];
//                 NSMutableDictionary *twitterParameters = [[NSMutableDictionary alloc] init];
//                 
//                 [twitterParameters setObject:@"5" forKey:@"count"];
//                 [twitterParameters setObject:@"1" forKey:@"include_entities"];
//                 
//                 SLRequest *postRequest = [SLRequest
//                                           requestForServiceType:SLServiceTypeTwitter
//                                           requestMethod:SLRequestMethodGET
//                                           URL:requestURL
//                                           parameters:twitterParameters];
//                 
//                 postRequest.account = twitterAccount;
//                 
//                 [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
//                  {
//                      self.dataSource = [NSJSONSerialization JSONObjectWithData:responseData
//                                                                        options:NSJSONReadingMutableLeaves
//                                                                          error:&error];
//                      
//                      if(self.dataSource){
//                          results = [self.dataSource valueForKey:@"ids"];
//                          //                        NSLog(@"Results: %@", results);
//                          //                    theString = results[0];
//                          //                        NSLog(@"theString Value = %@", theString);
//                          
//                      }
//                      
//                      if (self.dataSource.count != 0) {
//                          dispatch_async(dispatch_get_main_queue(), ^{[self.tableView reloadData];
//                              
//                          });
//                      }
//                  }];
//             }
//             //        } else {
//             // HANDLE FAILURE TO GET ACCOUNT ACCESS
//         }
//     }];
//}




@end