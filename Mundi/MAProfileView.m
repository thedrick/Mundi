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
        settingsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        myEventsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        myGroupsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self loadContent];
    }
    return self;
}

- (void)loadContent
{
    PFUser *user = [PFUser currentUser];
    NSString *pictureURL = [user objectForKey:@"pictureURL"];
    //
//    PF_FBProfilePictureView *userProfilePicture = [[PF_FBProfilePictureView alloc] init];
//    userProfilePicture.profileID = userId;
//    profilePicture = [userProfilePicture init];
    
    //    profilePicture = [userProfilePicture initWithProfileID:userId pictureCropping:PF_FBProfilePictureCroppingSquare];
    
    [profilePicture setImageWithURL:[NSURL URLWithString:pictureURL]];
    
    UIFont *titleFont = [UIFont fontWithName:@"Raleway" size:60];
    UIFont *locationFont = [UIFont fontWithName:@"DroidSans" size:11];
    UIColor *fontColor = [UIColor colorWithWhite:0.2 alpha:1];
    usernameLabel.text = [user objectForKey:@"facebookName"];
    usernameLabel.font = titleFont;
    usernameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    usernameLabel.numberOfLines = 2;
    usernameLabel.textColor = fontColor;
    
    locationLabel.text = [user objectForKey:@"locationString"];
    locationLabel.font = locationFont;
    locationLabel.lineBreakMode = NSLineBreakByWordWrapping;
    locationLabel.numberOfLines = 1;
    locationLabel.textColor = fontColor;
    
    [self addSubview:usernameLabel];
    [self addSubview:locationLabel];
    [self addSubview:profilePicture];
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
