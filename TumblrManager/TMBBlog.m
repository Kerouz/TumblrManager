//
//  TMBBlog.m
//  TumblrManager
//
//  Created by Andie Le Quiniat on 25/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import "TMBBlog.h"

@implementation TMBBlog

- (id) initWithDetails
{
    if ((self = [super init])) {
                
        _blogTitle = @"Blog Title";
        _blogAvatar = [UIImage imageNamed:@"QuestionMark.png"];
        _blogDescription = @"Blog description goes here";
        _blogUpdated = [NSDate date];
        NSLog(@"Date Created: %@", _blogUpdated);
//        _blogPosts = 5;
    }
    return self;
}

@end
