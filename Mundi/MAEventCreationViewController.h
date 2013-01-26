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
@property (weak, nonatomic) IBOutlet UITextField *eventName;
@property (weak, nonatomic) IBOutlet UITextView *eventDetails;
@property (weak, nonatomic) IBOutlet UITextField *location;
@property (strong, nonatomic) UIDatePicker *picker;
- (IBAction)eventDate:(id)sender;
- (IBAction)eventCategory:(id)sender;
- (IBAction)createEvent:(id)sender;

@end
