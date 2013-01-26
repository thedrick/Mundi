//
//  MASingleEventViewController.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MASingleEventViewController.h"
#import "MASingleEventView.h"
#import "MAAttendeesViewController.h";

@interface MASingleEventViewController ()

@end

@implementation MASingleEventViewController
@synthesize eventCategory, eventName, eventCreator, eventDetails, eventImage;
@synthesize eventLocation, eventTime;
@synthesize updateAttendanceButton;

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
    eventView.eventTitle.text = [object objectForKey:@"name"];
    eventView.locationLabel.text = [object objectForKey:@"locationString"];
    eventView.creatorLabel.text = [object objectForKey:@"creatorUsername"];
    eventView.timeLabel.text = [object objectForKey:@"time"];
    eventView.dateLabel.text = [object objectForKey:@"date"];
    eventView.detailLabel.text = [object objectForKey:@"details"];
    [eventView.joinButton addTarget:self
                             action:@selector(joinEvent:)
                   forControlEvents:UIControlEventTouchUpInside];
    [eventView.attendeesButton addTarget:self
                                  action:@selector(viewAttendees:)
                        forControlEvents:UIControlEventTouchUpInside];
    self.view = eventView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [eventName setText:[object objectForKey:@"name"]];
    [eventLocation setText:[object objectForKey:@"locationString"]];
    [eventDetails setText:[object objectForKey:@"details"]];
    [eventCategory setText:[object objectForKey:@"category"]];
    
    PFObject *user = [PFUser currentUser];
    NSString *userAttendingEvents = (NSString *)[user objectForKey:@"attendingEvents"];
    
    NSString *eventAttendees = (NSString *)[object objectForKey:@"attendees"];

    if(userAttendingEvents == nil || eventAttendees == nil) {
        updateAttendanceButton.titleLabel.text = @"+";
    }
    else{
        updateAttendanceButton.titleLabel.text = @"-";
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = [object objectForKey:@"name"];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
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
    
    //Get User ID and and User's Attending Events
    NSString *userId = user.objectId;
    NSString *userAttendingEvents = (NSString *)[user objectForKey:@"attendingEvents"];
    
    
    //Get Event ID and attendees
    NSString *eventId = object.objectId;
    NSString *eventAttendees = (NSString *)[object objectForKey:@"attendees"];
    
    
    NSRange result = [eventAttendees rangeOfString:userId];
    NSString *eventAttendeesNew = [[NSString alloc] init];
    NSString *userAttendingEventsNew = [[NSString alloc] init];
    
    //If user is not attending any events set to empty string
    if(userAttendingEvents == nil) {
        userAttendingEvents = @"";
    }
    
    if(eventAttendees == nil) {
        eventAttendees = @"";
    }
    
    NSString *userIdWithComma = [@", " stringByAppendingString:userId];
    NSString *eventIdWithComma = [@", " stringByAppendingString:eventId];
    
    //Check if user is attending event currently
    if(result.location != NSNotFound) {
        //IF YES, DELETE USER FROM EVENT ATTENDEES AND DELETE EVENT FROM USER'S ATTENDING EVENTS
        eventAttendeesNew = [eventAttendees stringByReplacingOccurrencesOfString:userIdWithComma withString:@""];
        NSLog(@"eventAttendeesNew: %@", eventAttendeesNew);
        [object setObject:eventAttendeesNew forKey:@"attendees"];
        userAttendingEventsNew = [userAttendingEvents stringByReplacingOccurrencesOfString:eventIdWithComma withString:@""];
        [user setObject:userAttendingEventsNew forKey:@"attendingEvents"];
        [updateAttendanceButton.titleLabel setText:@"+"];
        [updateAttendanceButton setNeedsDisplay];
    } else {
        //IF NO, ADD EVENT TO USER'S ATTENDING EVENTS AND ADD USER TO EVENT'S ATTENDEES
        eventAttendeesNew = [eventAttendees stringByAppendingString:userIdWithComma];
        userAttendingEventsNew = [userAttendingEvents stringByAppendingString:eventIdWithComma];
        updateAttendanceButton.titleLabel.text = @"-";
        [updateAttendanceButton setNeedsDisplay];
    }
    //UPDATE IN DATABASE AND SAVE
    [object setObject:eventAttendeesNew forKey:@"attendees"];
    [user setObject:userAttendingEventsNew forKey:@"attendingEvents"];
    [object saveInBackground];
    [user saveInBackground];
}


- (IBAction)joinEvent:(id)sender {
}

- (IBAction)viewAttendees:(id)sender
{
    PFUser *user = [PFUser currentUser];
    
    NSString *attendees = [object objectForKey:@"attendees"];
    NSArray *eventAttendees;
    if(attendees == nil){
        //creator is only attendee
        eventAttendees = [NSArray arrayWithObjects:user.objectId, nil];
    } else {
        NSString *attendeesOnly = [attendees stringByReplacingOccurrencesOfString:@", " withString:@" "];
        eventAttendees = [attendeesOnly componentsSeparatedByString:@" "];
    }
    MAAttendeesViewController *attendeesVC = [[MAAttendeesViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:attendeesVC animated:YES];
}

@end
