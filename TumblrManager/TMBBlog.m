//
//  TMBBlog.m
//  TumblrManager
//
//  Created by Andie Le Quiniat on 25/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import "TMBBlog.h"
#import "TMAPIClient.h"

@implementation TMBBlog

- (id) initWithDetails
{
    if ((self = [super init])) {
        
        // Authenticate via API Key
        [TMAPIClient sharedInstance].OAuthConsumerKey = @"1kNHEcklCA6h5i7xG4HDsJA4QVcYN9tNsUgmxCqzX2bxsK7VjX";
        
        // Make the request
        [[TMAPIClient sharedInstance] blogAvatar:@"fairlyhuman.tumblr.com"
                                            size:64
                                        callback:^ (id result, NSError *error) {
                                            // ...
                                        }];
        
        
        _blogTitle = @"Blog Title";
        _blogAvatar = [UIImage imageNamed:@"QuestionMark.png"];
        _blogDescription = @"Blog description goes here";
        _blogUpdated = [NSDate date];
        
//        NSLog(@"Date Created: %@", _blogUpdated);
//        _blogPosts = 5;
    }
    return self;
}

- (void)dealloc
{
    self.blogUpdated = nil;
}

@end
