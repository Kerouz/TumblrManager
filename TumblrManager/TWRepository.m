//
//  Created by Jesse Collis on 12/08/13.
//  Copyright (c) 2013 RMIT. All rights reserved.
//

#import "RMITFoursquareRepository.h"
#import "RMITVenue.h"

@interface RMITFoursquareRepository()
@property (nonatomic, strong, readwrite) NSArray *venues;
@property (nonatomic, strong) NSString *fourSquareClientID;
@property (nonatomic, strong) NSString *fourSquareAppSecret;
@end


@implementation RMITFoursquareRepository

- (id)init
{
    if (self = [super init])
    {
//         these values may change, saving them in the FourSquareDemo-Info.plist is a good way to store values
//         without having them in code.
//         [NSBundle mainBundle] objectForInfoDictionaryKey: is a very good way to get the values stored in the
//         info.plist file of an app.

        self.fourSquareClientID = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"RMITFoursquareClientID"];
        self.fourSquareAppSecret = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"RMITFoursquareSecret"];
    }
    return self;
}

- (void)fetchVenues
{
    if (self.term == nil) //You must set a term...
    {
        [self.delegate repository:self didFailToLoadVenuesWithTerm:nil];
        return;
    }

    NSString *urlEncodedTerm = [self.term stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    //Construct the Foursquare URL
    NSString *urlString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?client_id=%1$@&client_secret=%2$@&near=%3$@",
                           self.fourSquareClientID, self.fourSquareAppSecret, urlEncodedTerm];

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (connectionError)
                               {
                                   [self handleNetworkErorr:connectionError];
                               }
                               else
                               {
                                   [self handleNetworkResponse:data];
                               }
                           }];
}

#pragma mark - Private Failure Methods

- (void)handleNetworkErorr:(NSError *)error
{
    self.venues = nil;

    if ([self.delegate respondsToSelector:@selector(repository:didFailToLoadVenuesWithTerm:)])
    {
        [self.delegate repository:self didFailToLoadVenuesWithTerm:self.term];
    }
}

#pragma mark - Private Success Methods

- (void)handleNetworkResponse:(NSData *)data
{
    NSError *error;
    id JSONResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

    if (error)
    {
        [self handleNetworkErorr:error];
        return;
    }

    id responseArray = [JSONResponse valueForKeyPath:@"response.groups"][0][@"items"];

    NSMutableArray *venues = [[NSMutableArray alloc] initWithCapacity:[responseArray count]];
    for (id venueDict in responseArray)
    {
        RMITVenue *venue = [[RMITVenue alloc] initWithAPIResponse:venueDict];
        [venues addObject:venue];
    }

    self.venues = venues;

    if ([self.delegate respondsToSelector:@selector(repository:didLoadVenues:)])
    {
        [self.delegate repository:self didLoadVenues:self.venues];
    }
}



@end
