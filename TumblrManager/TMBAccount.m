//
//  TMBAccount.m
//  TumblrManager
//
//  Created by Andie Le Quiniat on 24/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import "TMBAccount.h"
#import "TMBBlog.h"

@implementation TMBAccount

- (id) initWithAccounts
{
        if ((self = [super init])) {
            _accountBlogs = [NSArray arrayWithObjects: @"Red", @"Green", @"Blue", @"Yellow", nil];
        }
        return self;
}

-(id) initWithDetails: (NSString *)passedAccountName
{
    if ((self = [super init])) {
        _accountName = passedAccountName;
        _accountBlogs = [NSMutableArray arrayWithObjects: nil];
        
//        int randomTestNumber = (arc4random() % 5) + 1;
        int randomTestNumber = 3;
        
        for (int i=0; i< randomTestNumber; i++) {
            TMBBlog *tempBlog = [[TMBBlog alloc] initWithDetails];
            [_accountBlogs addObject:tempBlog];
        }
    }
    return self;
}


@end
