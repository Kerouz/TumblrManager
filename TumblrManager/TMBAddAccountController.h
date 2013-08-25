//
//  TMBAddAccountController.h
//  TumblrManager
//
//  Created by Andie Le Quiniat on 25/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBAddAccountController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *emailAddress;
@property (strong, nonatomic) IBOutlet UITextField *accountPassword;

@end
