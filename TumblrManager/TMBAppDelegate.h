//
//  TMBAppDelegate.h
//  TumblrManager
//
//  Created by Andie Le Quiniat on 24/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@class TMBViewController;

@interface TMBAppDelegate : UIResponder <UIApplicationDelegate>
//{
//    id results;
//}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TMBViewController *viewController;
@property (strong, nonatomic) UINavigationController *navController;
//@property (strong, nonatomic) NSMutableArray *accounts;
@property (strong, nonatomic) NSArray *dataSource;
@property (strong, nonatomic) NSArray *results;


-(void) getFollowed;

@end



