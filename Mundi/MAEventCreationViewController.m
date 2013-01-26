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
@synthesize eventName, eventDetails;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)eventDate:(id)sender
{
    if (time) {
        time = nil;
    }
    time = [NSDate dateWithTimeIntervalSinceNow:20];
}

- (IBAction)eventLocation:(id)sender
{
    locationString = @"My location";
}

- (IBAction)eventCategory:(id)sender
{
    category = @"Food";
}

- (IBAction)createEvent:(id)sender
{
    if (!time || !locationString || !category) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event Invalid"
                                                        message:@"Make sure you fill out all fields"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    } else {
        PFObject *newEvent = [PFObject objectWithClassName:@"Event"];
    }
}
@end
