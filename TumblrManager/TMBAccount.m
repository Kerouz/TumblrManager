//
//  TMBAccount.m
//  TumblrManager
//
//  Created by Andie Le Quiniat on 24/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import "TMBAccount.h"

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
        _accountBlogs = [NSArray arrayWithObjects: @"Square", @"Tri", @"Cross", @"Circle", nil];
    }
    return self;
}


@end
