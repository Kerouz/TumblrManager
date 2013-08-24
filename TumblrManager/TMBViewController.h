//
//  TMBViewController.h
//  TumblrManager
//
//  Created by Andie Le Quiniat on 24/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *accounts;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
