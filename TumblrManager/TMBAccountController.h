//
//  TMBAccountController.h
//  TumblrManager
//
//  Created by Andie Le Quiniat on 24/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBAccount.h"

@interface TMBAccountController : UIViewController {
    
    TMBAccount *currentAccount;
    NSIndexPath *index;
    
    IBOutlet UITableView *tableView;
}

- (id)initWithIndexPath: (NSIndexPath *)indexPath;

@end
