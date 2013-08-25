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
    // Setting up two accounts at the moment, to be replaced with real ones later
    
    TMBAccount *account1 = [[TMBAccount alloc] init];
    account1.accountName = @"Followed 1";
    [account1.accountBlogs addObject:@"Blog 1"];
    [account1.accountBlogs addObject:@"Blog 2"];

    TMBAccount *account2 = [[TMBAccount alloc] init];
    account2.accountName = @"Followed 2";
    [account2.accountBlogs addObject:@"Blog A"];
    [account2.accountBlogs addObject:@"Blog B"];
    [account2.accountBlogs addObject:@"Blog C"];
    
    TMBAccount *account3 = [[TMBAccount alloc] initWithAccounts];
    account3.accountName = @"Followed 3";
    
    TMBAccount *account4 = [[TMBAccount alloc] initWithDetails:@"Followed 4"];
    
    
    // Remember: Need to set up the inital accounts array
    self.accounts = [[NSMutableArray alloc] initWithObjects: account1, account2, account3, account4, nil];
    
    self.viewController = [[TMBViewController alloc] initWithNibName:@"TMBViewController" bundle:nil];
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    return YES;
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
