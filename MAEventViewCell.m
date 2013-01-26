//
//  MAFeedViewCell.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MAEventViewCell.h"

@implementation MAEventViewCell
@synthesize eventDetails, eventTitle, timeLabel, eventDate, object;

- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EventCell"];
    if (self) {
        eventTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 200, 25)];
        eventDate = [[UILabel alloc] initWithFrame:CGRectMake(5, 27, 150, 25)];
        eventDetails = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 260, 25)];
        timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 5, 100, 40)];
    }
    return self;
}

- (void)setObject:(PFObject *)obj
{
    object = obj;
    [self setupLabels];
}

- (void)setupLabels
{
    UIFont *titleFont = [UIFont fontWithName:@"DroidSans" size:18];
    UIFont *detailsFont = [UIFont fontWithName:@"DroidSans" size:12];
    UIFont *dateFont = [UIFont fontWithName:@"DroidSans" size:16];
    UIFont *timeFont = [UIFont fontWithName:@"DroidSans" size:36];
    UIColor *regularColor = [UIColor colorWithWhite:0.3 alpha:1];
    UIColor *poppy = [UIColor colorWithRed:(248/255.0f) green:(102/255.0f) blue:(41/255.0f) alpha:1];
    UIColor *turquoise = [UIColor colorWithRed:(0/255.0f) green:(200/255.0f) blue:(184/255.0f) alpha:1];
    UIColor *blue = [UIColor colorWithRed:(85/255.0f) green:(95/255.0f) blue:(255/255.0f) alpha:1];
    UIColor *red = [UIColor colorWithRed:(190/255.0f) green:(0/255.0f) blue:(0/255.0f) alpha:1];
    
    // Title
    [eventTitle setText:[object objectForKey:@"name"]];
    [eventTitle setBackgroundColor:[UIColor clearColor]];
    [eventTitle setTextColor:regularColor];
    [eventTitle setFont:titleFont];
    
    // Details
    [eventDetails setText:[object objectForKey:@"details"]];
    [eventDetails setBackgroundColor:[UIColor clearColor]];
    [eventDetails setTextColor:regularColor];
    [eventDetails setFont:detailsFont];
    
    // Date
    NSDate *date = [object objectForKey:@"date"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [eventDate setText:[dateFormatter stringFromDate:date]];
    [eventDate setBackgroundColor:[UIColor clearColor]];
    [eventDate setTextColor:regularColor];
    [eventDate setFont:dateFont];
    
    // Time
    [timeLabel setText:[object objectForKey:@"time"]];
    [timeLabel setBackgroundColor:[UIColor clearColor]];
    [timeLabel setFont:timeFont];

    NSString *eventCategory = [object objectForKey:@"category"];
    
    if([eventCategory isEqualToString:@"Food & Drink"]){
        [timeLabel setTextColor:poppy];    
    } else if([eventCategory isEqualToString:@"Chill"]){
        [timeLabel setTextColor:turquoise];
    } else if([eventCategory isEqualToString:@"Adventure"]){
        [timeLabel setTextColor:blue];
    } else if([eventCategory isEqualToString:@"Outdoors"]) {
        [timeLabel setTextColor:red];
    }
    

    [self.contentView addSubview:eventTitle];
    [self.contentView addSubview:eventDetails];
    [self.contentView addSubview:eventDate];
    [self.contentView addSubview:timeLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
