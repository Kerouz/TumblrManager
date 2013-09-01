//
//  Created by Jesse Collis on 12/08/13.
//  Copyright (c) 2013 RMIT. All rights reserved.
//

@interface TWRepository : NSObject


//@property (nonatomic, strong, readonly) NSString *fourSquareClientID;
//@property (nonatomic, strong, readonly) NSString *fourSquareAppSecret;

@property (nonatomic, strong) NSString *term;
@property (nonatomic, strong, readonly) NSArray *venues;

- (void)getFollowed;

- (void)handleNetworkErorr:(NSError *)error;

@end
