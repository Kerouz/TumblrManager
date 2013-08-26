//
//  TMBBlogController.m
//  TumblrManager
//
//  Created by Andie Le Quiniat on 25/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import "TMBBlogController.h"
#import "TMBAppDelegate.h"
#import "TMBAccount.h"

@interface TMBBlogController ()

@end

@implementation TMBBlogController

- (id)initWithIndexPath:(NSIndexPath *)indexPath {
    if ((self = [super init])) {
        index = indexPath;
    }
    return self;
}

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
    
    TMBAppDelegate *delegate = (TMBAppDelegate *)[[UIApplication sharedApplication] delegate];
    TMBAccount *currentAccount = [delegate.accounts objectAtIndex:index.row];
        
    currentBlog = [currentAccount.accountBlogs objectAtIndex:index.row];
    
    self.title = currentBlog.blogTitle;

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    _blogOwnerName.text = currentBlog.blogTitle;
    _blogOwnerName.editable = NO;
    NSLog(@"%@", currentBlog.blogUpdated);
    _blogUpdateLabel.text = [dateFormatter stringFromDate:currentBlog.blogUpdated];
    _blogAvatarImage.image = currentBlog.blogAvatar;
    _blogDescriptionText.text = currentBlog.blogDescription;
    _blogDescriptionText.editable = NO;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
