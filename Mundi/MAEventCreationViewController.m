//
//  MAEventCreationViewController.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MAEventCreationViewController.h"
#import <Parse/Parse.h>
#import "MACreateEventView.h"

@interface MAEventCreationViewController ()

@end

@implementation MAEventCreationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"+"];
    }
    return self;
}

- (void)loadView
{
    MACreateEventView *createView = [[MACreateEventView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [createView.nextButton addTarget:self
                              action:@selector(createEvent:)
                    forControlEvents:UIControlEventTouchUpInside];
    [createView.eventName setDelegate:self];
    [createView.location setDelegate:self];
    [createView.date setDelegate:self];
    [createView.details setDelegate:self];
    [createView.category setDelegate:self];
    [createView.time setDelegate:self];
    self.view = createView;
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

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    initialCenter = self.view.center;
    self.view.center = CGPointMake(initialCenter.x, initialCenter.y - (textField.frame.origin.y - 15));
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.center = initialCenter;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    initialCenter = self.view.center;
    self.view.center = CGPointMake(initialCenter.x, initialCenter.y - (textView.frame.origin.y - 15));
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.view.center = initialCenter;
}

- (IBAction)createEvent:(id)sender
{
    MACreateEventView *myView = (MACreateEventView *)self.view;
    time = myView.time.text;
    locationString = myView.location.text;
    category = myView.category.text;
    name = myView.eventName.text;
    date = myView.date.text;
    
    PFObject *user = [PFUser currentUser];
    PFObject *newEvent = [PFObject objectWithClassName:@"Event"];
    
    if (!time || !locationString || !category || !name || !date) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event Invalid"
                                                        message:@"Make sure you fill out all fields"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    } else {
        NSString *userName = user.objectId;
        
        [newEvent setObject:name forKey:@"name"];
        [newEvent setObject:locationString forKey:@"locationString"];
        [newEvent setObject:category forKey:@"category"];
        [newEvent setObject:userName forKey:@"attendees"];
        [newEvent setObject:time forKey:@"time"];
        [newEvent setObject:date forKey:@"date"];
        [newEvent setObject:userName forKey:@"createdBy"];
        [newEvent setObject:[user objectForKey:@"facebookName"] forKey:@"creatorUsername"];
        [newEvent setObject:myView.details.text forKey:@"details"];
        
        [newEvent saveInBackground];
    }
}

@end
