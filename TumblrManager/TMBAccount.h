//
//  TMBAccount.h
//  TumblrManager
//
//  Created by Andie Le Quiniat on 24/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBAccount : NSObject
{
    
}

@property (nonatomic, strong) NSString *accountName;
@property (nonatomic, strong) UIImage *accountImage;
@property (nonatomic, strong) NSMutableArray *accountBlogs;

@end
