//
//  TwitterAppViewController.h
//  Prototype
//
//  Created by Andie Le Quiniat on 31/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBAppDelegate.h"
#import "TWRepository.h"



@interface TMBViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
//    NSMutableArray *account;
    NSArray *results;
    TMBAppDelegate *delegate;
    
}

@property (nonatomic, strong) TWRepository *repository;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
//@property (strong, nonatomic) NSArray *dataSource;

- (void)configureWithRepository:(TWRepository *)repository;


@end