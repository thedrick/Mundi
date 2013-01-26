//
//  MAEventCreationViewController.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MAEventCreationViewController.h"
#import <Parse/Parse.h>

@interface MAEventCreationViewController ()

@end

@implementation MAEventCreationViewController
@synthesize eventName, eventDetails, picker, location;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIDatePicker *dp = [[UIDatePicker alloc] init];
        self.picker = dp;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (IBAction)eventDate:(id)sender
{
    if (time) {
        time = nil;
    }
    //Add the picker to the view
    [self.view addSubview:self.picker];
    
    time = [NSDate dateWithTimeIntervalSinceNow:20];
    [self.picker removeFromSuperview];
}

- (IBAction)eventCategory:(id)sender
{
    category = @"Food";
}

- (IBAction)createEvent:(id)sender
{
    locationString = self.location.text;
    name = self.eventName.text;
    if (!time || !locationString || !category || !name) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event Invalid"
                                                        message:@"Make sure you fill out all fields"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    } else {
        PFObject *newEvent = [PFObject objectWithClassName:@"Event"];
        [newEvent setObject:name forKey:@"name"];
        [newEvent setObject:locationString forKey:@"locationString"];
        [newEvent setObject:category forKey:@"category"];
        [newEvent setObject:time forKey:@"date"];
        [newEvent setObject:self.eventDetails.text forKey:@"details"];
        [newEvent saveEventually];
    }
}
@end
