//
//  TwitterAppViewController.m
//  Prototype
//
//  Created by Andie Le Quiniat on 31/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import "TwitterAppViewController.h"

@interface TwitterAppViewController ()

@end

@implementation TwitterAppViewController

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
    // Do any additional setup after loading the view from its nib.
 //   [self getTimeLine];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getTimeLine {
    ACAccountStore *account = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [account requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
        if (granted) {
            NSArray *arrayOfAccounts = [account accountsWithAccountType:accountType];
            if ([arrayOfAccounts count] > 0) {
                ACAccount *twitterAccount = [arrayOfAccounts lastObject];
                
                NSURL *requestURL = [NSURL URLWithString:@"api.twitter.com/1/statuses/home_timeline.json"];
                
                NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithCapacity:20];
 //               [parameters setObject:@"20" forKey:"count"];
 //               [parameters setObject:@"1" forKey:"include_entities"];
                
                SLRequest *postRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:requestURL parameters:parameters];
                
                postRequest.account = twitterAccount;
                
                [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    self.dataSource = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&error];
                    if (self.dataSource.count != 0) {
                        dispatch_async(dispatch_get_main_queue(), ^{[self.tableView reloadData];
                            
                        });
                    }
                }];
            }
        } else {
            // HANDLE FAILURE TO GET ACCOUNT ACCESS
        }
    }];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _dataSource.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *tweet = _dataSource [[indexPath row]];
    cell.textLabel.text = tweet [@"text"];
    return cell;
}



@end
