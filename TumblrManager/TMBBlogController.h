//
//  TMBBlogController.h
//  TumblrManager
//
//  Created by Andie Le Quiniat on 25/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBBlogController : UIViewController {
    
//    TMBAccount *currentAccount;
    NSIndexPath *index;
    NSString *currentBlog;
}



@property (strong, nonatomic) IBOutlet UITextView *blogOwnerName;

- (id)initWithIndexPath: (NSIndexPath *)indexPath;


@end
