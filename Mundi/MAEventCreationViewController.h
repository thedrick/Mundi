//
//  MAEventCreationViewController.h
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MAEventCreationViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, PF_FBFriendPickerDelegate>
{
    NSString *time;
    NSString *name;
    NSString *locationString;
    NSString *category;
    NSString *date;
    CGPoint initialCenter;
}
- (IBAction)createEvent:(id)sender;

@end
