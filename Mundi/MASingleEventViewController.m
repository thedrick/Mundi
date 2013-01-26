//
//  MASingleEventViewController.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MASingleEventViewController.h"

@interface MASingleEventViewController ()

@end

@implementation MASingleEventViewController
@synthesize eventCategory, eventName, eventCreator, eventDetails, eventImage;
@synthesize eventLocation, eventTime;

- (id)initWithObject:(PFObject *)obj
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        object = obj;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [eventName setText:[object objectForKey:@"name"]];
    NSDate *date = [object objectForKey:@"date"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [eventTime setText:[dateFormatter stringFromDate:date]];
    [eventLocation setText:[object objectForKey:@"locationString"]];
    [eventDetails setText:[object objectForKey:@"details"]];
    [eventCategory setText:[object objectForKey:@"creatorUsername"]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = [object objectForKey:@"name"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)eventAttendees:(id)sender {
}

- (IBAction)updateAttendance:(id)sender {
}
@end
