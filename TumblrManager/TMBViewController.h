//
//  TwitterAppViewController.h
//  Prototype
//
//  Created by Andie Le Quiniat on 31/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBAppDelegate.h"


@interface TMBViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    //    NSString *theString;
    NSMutableArray *account;
    NSMutableArray *results;
    TMBAppDelegate *delegate;
    
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
//@property (strong, nonatomic) NSArray *dataSource;

@end