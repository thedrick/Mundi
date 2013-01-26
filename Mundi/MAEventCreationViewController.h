//
//  MAEventCreationViewController.h
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAEventCreationViewController : UIViewController
{
    NSDate *time;
    NSString *locationString;
    NSString *category;
}
@property (weak, nonatomic) IBOutlet UITextField *eventName;
@property (weak, nonatomic) IBOutlet UITextView *eventDetails;
- (IBAction)eventDate:(id)sender;
- (IBAction)eventLocation:(id)sender;
- (IBAction)eventCategory:(id)sender;
- (IBAction)createEvent:(id)sender;

@end
