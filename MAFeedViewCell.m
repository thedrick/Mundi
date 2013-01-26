//
//  MAFeedViewCell.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MAFeedViewCell.h"

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
    // Title
    [eventTitle setText:[object objectForKey:@"name"]];
    [eventTitle setBackgroundColor:[UIColor clearColor]];
    [eventTitle setTextColor:[UIColor colorWithRed:136 green:136 blue:136 alpha:1]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
