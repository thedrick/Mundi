//
//  MAFeedViewCell.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MAEventViewCell.h"

@implementation MAEventViewCell
@synthesize eventDetails, eventTitle, timeLabel, eventDate;

- (id)initWithEvent:(PFObject *)obj
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EventCell"];
    if (self) {
        object = obj;
        eventTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 200, 25)];
        eventDate = [[UILabel alloc] initWithFrame:CGRectMake(5, 25, 150, 25)];
        eventDetails = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 260, 25)];
        timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 5, 60, 40)];
        [self setupLabels];
    }
    return self;
}

- (void)setupLabels
{
    UIFont *titleFont = [UIFont fontWithName:@"Droid Sans" size:18];
    UIFont *detailsFont = [UIFont fontWithName:@"Droid Sans" size:12];
    UIFont *dateFont = [UIFont fontWithName:@"Droid Sans" size:16];
    UIFont *timeFont = [UIFont fontWithName:@"Droid Sans" size:36];
    
    // Title
    [eventTitle setText:[object objectForKey:@"name"]];
    [eventTitle setBackgroundColor:[UIColor clearColor]];
    [eventTitle setTextColor:[UIColor colorWithRed:136 green:136 blue:136 alpha:1]];
    [eventTitle setFont:titleFont];
    
    // Details
    [eventDetails setText:[object objectForKey:@"details"]];
    [eventDetails setBackgroundColor:[UIColor clearColor]];
    [eventDetails setTextColor:[UIColor colorWithRed:136 green:136 blue:136 alpha:1]];
    [eventDetails setFont:detailsFont];
    
    // Date
    [eventDate setText:[object objectForKey:@"date"]];
    [eventDate setBackgroundColor:[UIColor clearColor]];
    [eventDate setTextColor:[UIColor colorWithRed:136 green:136 blue:136 alpha:1]];
    [eventDate setFont:dateFont];
    
    // Time
    [timeLabel setText:[object objectForKey:@"time"]];
    [timeLabel setBackgroundColor:[UIColor clearColor]];
    [timeLabel setTextColor:[UIColor colorWithRed:136 green:136 blue:136 alpha:1]];
    [timeLabel setFont:timeFont];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
