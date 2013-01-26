//
//  MASingleEventViewController.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MASingleEventViewController.h"
#import "MASingleEventView.h"

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

- (void)loadView
{
    MASingleEventView *eventView = [[MASingleEventView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view = eventView;
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
    self.navigationItem.title = [object objectForKey:@"name"];
    
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(swipeBack:)];
    [swipeRecognizer setDelegate:self];
    [self.view addGestureRecognizer:swipeRecognizer];

}

- (void)swipeBack:(UISwipeGestureRecognizer *)gr
{
    if (gr.direction ==  UISwipeGestureRecognizerDirectionRight) {
        if (gr.state == UIGestureRecognizerStateEnded) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)eventAttendees:(id)sender {
}

- (IBAction)updateAttendance:(id)sender {
    PFObject *user = [PFUser currentUser];
    
    NSString *userId = user.objectId;
    NSString *userAttendingEvents = (NSString *)[user objectForKey:@"attendingEvents"];
    
    NSString *eventId = object.objectId;
    NSString *eventAttendees = (NSString *)[object objectForKey:@"attendees"];
    
    NSRange result = [eventAttendees rangeOfString:userId];
    NSString *eventAttendeesNew = [[NSString alloc] init];
    NSString *userAttendingEventsNew = [[NSString alloc] init];
    
    if(userAttendingEvents == nil) {
        userAttendingEvents = @"";
    }
    
    if(result.location != NSNotFound) {
        eventAttendeesNew = [eventAttendees stringByReplacingOccurrencesOfString:userId withString:@""];
        NSLog(@"eventAttendeesNew: %@", eventAttendeesNew);
        [object setObject:eventAttendeesNew forKey:@"attendees"];
        userAttendingEventsNew = [userAttendingEvents stringByReplacingOccurrencesOfString:eventId withString:@""];
        [user setObject:userAttendingEventsNew forKey:@"attendingEvents"];
    } else {
        NSString *appendingUserId = [@", " stringByAppendingString:userId];
        NSString *appendingEventId = [@", " stringByAppendingString:eventId];
        eventAttendeesNew = [eventAttendees stringByAppendingString:appendingUserId];
        userAttendingEventsNew = [userAttendingEvents stringByAppendingString:appendingEventId];
    }
    NSLog(@"eventAttendeesNew outside: %@", eventAttendeesNew);
    NSLog(@"userAttendingEventsNew outside: %@", userAttendingEventsNew);
    [object setObject:eventAttendeesNew forKey:@"attendees"];
    [user setObject:userAttendingEventsNew forKey:@"attendingEvents"];
    [object saveInBackground];
    [user saveInBackground];
}
@end
