//
//  MAProfileView.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MAProfileView.h"
#import "UIImageView+AFNetworking.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@implementation MAProfileView
@synthesize usernameLabel, locationLabel, profilePicture, addToGroupButton, inviteToEventButton;
@synthesize settingsButton, myEventsButton, myGroupsButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 320, 120)];
        locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 150, 200, 20)];
        profilePicture = [[UIImageView alloc] initWithFrame:CGRectMake(25, 140, 84, 84)];
        addToGroupButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        inviteToEventButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        myEventsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        myGroupsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self loadContent];
    }
    return self;
}

- (void)loadContent
{
    PFUser *user = [PFUser currentUser];
    NSString *pictureURL = [user objectForKey:@"pictureURL"];
    
    [profilePicture setImageWithURL:[NSURL URLWithString:pictureURL]];
    
    UIFont *titleFont = [UIFont fontWithName:@"Raleway" size:60];
    UIFont *locationFont = [UIFont fontWithName:@"DroidSans" size:12];
    UIColor *fontColor = [UIColor colorWithWhite:0.2 alpha:1];
    UIFont *buttonFont = [UIFont fontWithName:@"DroidSans" size:11];
    usernameLabel.text = [user objectForKey:@"facebookName"];
    usernameLabel.font = titleFont;
    usernameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    usernameLabel.numberOfLines = 2;
    usernameLabel.textColor = fontColor;
    usernameLabel.backgroundColor = [UIColor clearColor];
    
    locationLabel.text = [[user objectForKey:@"locationString"] uppercaseString];
    locationLabel.font = locationFont;
    locationLabel.lineBreakMode = NSLineBreakByWordWrapping;
    locationLabel.numberOfLines = 1;
    locationLabel.textColor = fontColor;
    locationLabel.backgroundColor = [UIColor clearColor];
    
    [self addSubview:usernameLabel];
    [self addSubview:locationLabel];
    [self addSubview:profilePicture];
    
    settingsButton.frame = CGRectMake(24, 260, 76, 76);
    settingsButton.backgroundColor = [UIColor whiteColor];
    UILabel *settingsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 76, 10)];
    settingsLabel.backgroundColor = [UIColor clearColor];
    settingsLabel.font = buttonFont;
    settingsLabel.textColor = fontColor;
    settingsLabel.text = @"SETTINGS";
    settingsLabel.textAlignment = NSTextAlignmentCenter;
    UIImageView *settingsImage = [[UIImageView alloc] initWithFrame:CGRectMake(21, 15, 34, 34)];
    [settingsImage setImage:[UIImage imageNamed:@"settings.png"]];
    settingsButton.layer.borderWidth = 0.5f;
    settingsButton.layer.cornerRadius = 6;
    settingsButton.layer.borderColor = [fontColor CGColor];
    [settingsButton addSubview:settingsLabel];
    [settingsButton addSubview:settingsImage];
    [self addSubview:settingsButton];
    
    myEventsButton.frame = CGRectMake(123, 260, 76, 76);
    myEventsButton.backgroundColor = [UIColor whiteColor];
    UILabel *eventsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 76, 10)];
    eventsLabel.backgroundColor = [UIColor clearColor];
    eventsLabel.font = buttonFont;
    eventsLabel.textColor = fontColor;
    eventsLabel.text = @"MY EVENTS";
    eventsLabel.textAlignment = NSTextAlignmentCenter;
    myEventsButton.layer.borderWidth = 0.5f;
    myEventsButton.layer.cornerRadius = 6;
    myEventsButton.layer.borderColor = [fontColor CGColor];
    [myEventsButton addSubview:eventsLabel];
    [self addSubview:myEventsButton];
    
    UIImageView *eventsImage = [[UIImageView alloc] initWithFrame:CGRectMake(21, 15, 34, 34)];
    [eventsImage setImage:[UIImage imageNamed:@"events.png"]];
    [myEventsButton addSubview:eventsImage];
    
    myGroupsButton.frame = CGRectMake(220, 260, 76, 76);
    myGroupsButton.backgroundColor = [UIColor whiteColor];
    UILabel *groupsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 76, 10)];
    groupsLabel.backgroundColor = [UIColor clearColor];
    groupsLabel.font = buttonFont;
    groupsLabel.textColor = fontColor;
    groupsLabel.text = @"MY GROUPS";
    groupsLabel.textAlignment = NSTextAlignmentCenter;
    myGroupsButton.layer.borderWidth = 0.5f;
    myGroupsButton.layer.cornerRadius = 6;
    myGroupsButton.layer.borderColor = [fontColor CGColor];
    [myGroupsButton addSubview:groupsLabel];
    [self addSubview:myGroupsButton];
    
    UIImageView *groupsImage = [[UIImageView alloc] initWithFrame:CGRectMake(21, 15, 34, 34)];
    [groupsImage setImage:[UIImage imageNamed:@"groups.png"]];
    [myGroupsButton addSubview:groupsImage];
    
    self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
