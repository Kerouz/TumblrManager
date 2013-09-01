//
//  TMBAppDelegate.m
//  TumblrManager
//
//  Created by Andie Le Quiniat on 24/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import "TMBAppDelegate.h"
#import "TMBViewController.h"
#import "TMBAccount.h"


@implementation TMBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Remember: Need to set up the inital accounts array
//    self.accounts = [[NSMutableArray alloc] initWithObjects: nil];
//    [self getFollowed];
    
    self.viewController = [[TMBViewController alloc] initWithNibName:@"TMBViewController" bundle:nil];
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) getFollowed {
    ACAccountStore *account = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [account requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
     {
         if (granted)
         {
             NSArray *arrayOfAccounts = [account accountsWithAccountType:accountType];
             
             if ([arrayOfAccounts count] > 0)
             {
                 ACAccount *twitterAccount = [arrayOfAccounts lastObject];
                 
                 NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/friends/ids.json"];
                 NSMutableDictionary *twitterParameters = [[NSMutableDictionary alloc] init];
                 
                 [twitterParameters setObject:@"5" forKey:@"count"];
                 [twitterParameters setObject:@"1" forKey:@"include_entities"];
                 
                 SLRequest *postRequest = [SLRequest
                                           requestForServiceType:SLServiceTypeTwitter
                                           requestMethod:SLRequestMethodGET
                                           URL:requestURL
                                           parameters:twitterParameters];
                 
                 postRequest.account = twitterAccount;
                 
                 [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                  {
                      self.dataSource = [NSJSONSerialization JSONObjectWithData:responseData
                                                                        options:NSJSONReadingMutableLeaves
                                                                          error:&error];
                      
                      if(self.dataSource)
                      {
                          _results = [self.dataSource valueForKey:@"ids"];
                        NSLog(@"Results from AppDelegate: %@", _results);
                        NSLog(@"1st Result from AppDelegate: %@", _results[0]);
                      }
                      
                      if (self.dataSource.count != 0) {
                          dispatch_async(dispatch_get_main_queue(), ^
                          {
                        //      [self.tableView reloadData];
                          });
                      }
                  }];
             }
             //        } else {
             // HANDLE FAILURE TO GET ACCOUNT ACCESS
                }
            }];
         }

     



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
