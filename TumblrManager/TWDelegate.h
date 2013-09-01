//
//  Created by Jesse Collis on 13/08/13.
//  Copyright (c) 2013 RMIT. All rights reserved.
//


@class RMITFoursquareRepository;

@protocol RMITFoursquareDelegate <NSObject>

@optional

- (void)repository:(RMITFoursquareRepository *)repository didLoadVenues:(NSArray *)venues;
- (void)repository:(RMITFoursquareRepository *)repository didFailToLoadVenuesWithTerm:(NSString *)term;

@end

