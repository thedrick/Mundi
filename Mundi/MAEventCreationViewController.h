//
//  MAEventCreationViewController.h
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAEventCreationViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
{
    NSDate *time;
    NSString *name;
    NSString *locationString;
    NSString *category;
}
- (IBAction)eventDate:(id)sender;
- (IBAction)eventCategory:(id)sender;
- (IBAction)createEvent:(id)sender;

@end
