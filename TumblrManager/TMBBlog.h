//
//  TMBBlog.h
//  TumblrManager
//
//  Created by Andie Le Quiniat on 25/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBBlog : NSObject
{
    
}

@property (nonatomic, weak) NSString *blogTitle;
@property (nonatomic, weak) UIImage *blogAvatar;
@property (nonatomic, weak) NSString *blogDescription;
@property (nonatomic, strong) NSDate *blogUpdated;

//@property (nonatomic, weak) NSNumber *blogPosts;


-(id) initWithDetails;

@end
