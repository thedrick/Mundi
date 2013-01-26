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

- (IBAction)eventDate:(id)sender
{
    if (time) {
        time = nil;
    }
    //Add the picker to the view
    
    time = [NSDate dateWithTimeIntervalSinceNow:20];
}

- (IBAction)eventCategory:(id)sender
{
    category = @"Food";
}

- (IBAction)createEvent:(id)sender
{
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
        [newEvent setObject:@"" forKey:@"attendees"];
        
        PFObject *user = [PFUser currentUser];
        NSString *userId = user.objectId;
        NSString* userName = [user objectForKey:@"username"];
        NSString *eventId = newEvent.objectId;
        NSString *eventIdComma = [@", " stringByAppendingString:eventId];
        NSString *userCreatedEvents = [user objectForKey:@"createdEvents"];
        NSString *userCreatedEventsNew = [userCreatedEvents stringByAppendingString:eventIdComma];
        
        [newEvent setObject:userId forKey:@"createdBy"];
        [newEvent setObject:userName forKey:@"creatorUsername"];
        
        [user setObject:userCreatedEventsNew forKey:@"createdEvents"];
        
        [newEvent saveInBackground];
        [user saveInBackground];
    }
    
    
    
}
@end
