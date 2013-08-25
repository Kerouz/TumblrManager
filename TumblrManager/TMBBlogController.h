//
//  TMBBlogController.h
//  TumblrManager
//
//  Created by Andie Le Quiniat on 25/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBBlog.h"

@interface TMBBlogController : UIViewController {
    
//    TMBAccount *currentAccount;
    NSIndexPath *index;

    // Was using string (before became object)
//     NSString *currentBlog;
    TMBBlog *currentBlog;
}



@property (strong, nonatomic) IBOutlet UITextView *blogOwnerName;
@property (strong, nonatomic) IBOutlet UILabel *blogUpdateLabel;
@property (strong, nonatomic) IBOutlet UITextView *blogDescriptionText;
@property (strong, nonatomic) IBOutlet UIImageView *blogAvatarImage;

- (id)initWithIndexPath: (NSIndexPath *)indexPath;


@end
