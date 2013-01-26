//
//  MASingleEventView.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MASingleEventView.h"

@implementation MASingleEventView
@synthesize eventTitle, creatorLabel, dateLabel, timeLabel, locationLabel, detailLabel;
@synthesize eventDetailView, eventTimeView, photoCollectionView;
@synthesize joinButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        eventTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
        eventTimeView = [[UIView alloc] initWithFrame:CGRectMake(10,
                                                                eventTitle.frame.origin.y + eventTitle.frame.size.height + 15,
                                                                 300,
                                                                 100)];
        eventDetailView = [[UIView alloc] initWithFrame:CGRectMake(10,
                                                                   eventTimeView.frame.origin.y + eventTimeView.frame.size.height + 10,
                                                                   300,
                                                                   70)];
        eventTimeView.backgroundColor = [UIColor whiteColor];
        eventDetailView.backgroundColor = [UIColor whiteColor];
        [self addSubview:eventTitle];
        [self addSubview:eventTimeView];
        [self addSubview:eventDetailView];
        
        UIFont *labelFont = [UIFont fontWithName:@"DroidSans" size:14];
        UIFont *titleFont = [UIFont fontWithName:@"Raleway" size:52];
        UIFont *detailFont = [UIFont fontWithName:@"DroidSans" size:11];
        UIColor *labelColor = [UIColor colorWithWhite:0.2 alpha:1.0];
        
        eventTitle.font = titleFont;
        eventTitle.text = @"Drinks at Shadyside";
        eventTitle.numberOfLines = 0;
        eventTitle.lineBreakMode = NSLineBreakByWordWrapping;
        eventTitle.backgroundColor = [UIColor clearColor];
        
        UILabel *creator = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 70, 20)];
        [creator setText:@"CREATOR"];
        [creator setFont:labelFont];
        [creator setTextColor:labelColor];
        creator.backgroundColor = [UIColor clearColor];
        
        UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 70, 20)];
        [date setText:@"DATE"];
        [date setFont:labelFont];
        [date setTextColor:labelColor];
        date.backgroundColor = [UIColor clearColor];
        
        UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 70, 20)];
        [time setText:@"TIME"];
        [time setFont:labelFont];
        [time setTextColor:labelColor];
        time.backgroundColor = [UIColor clearColor];
        
        UILabel *location = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 70, 20)];
        [location setText:@"LOCATION"];
        [location setFont:labelFont];
        [location setTextColor:labelColor];
        location.backgroundColor = [UIColor clearColor];
        
        [eventTimeView addSubview:creator];
        [eventTimeView addSubview:date];
        [eventTimeView addSubview:time];
        [eventTimeView addSubview:location];
        
        creatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 170, 20)];
        [creatorLabel setText:@"Creator name here"];
        creatorLabel.font = labelFont;
        creatorLabel.textColor = labelColor;
        creatorLabel.backgroundColor = [UIColor clearColor];
        [eventTimeView addSubview:creatorLabel];
        
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 30, 170, 20)];
        [dateLabel setText:@"Date goes here"];
        dateLabel.font = labelFont;
        dateLabel.textColor = labelColor;
        dateLabel.backgroundColor = [UIColor clearColor];
        [eventTimeView addSubview:dateLabel];
        
        timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 50, 170, 20)];
        [timeLabel setText:@"Creator name here"];
        timeLabel.font = labelFont;
        timeLabel.textColor = labelColor;
        timeLabel.backgroundColor = [UIColor clearColor];
        [eventTimeView addSubview:timeLabel];
        
        locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 70, 170, 20)];
        [locationLabel setText:@"Location goes here"];
        locationLabel.font = labelFont;
        locationLabel.textColor = labelColor;
        locationLabel.backgroundColor = [UIColor clearColor];
        [eventTimeView addSubview:locationLabel];
        
        UILabel *detail = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 70, 20)];
        detail.text = @"DETAILS";
        detail.font = labelFont;
        detail.textColor = labelColor;
        [eventDetailView addSubview:detail];
        
        detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, -18, 250, 120)];
        detailLabel.text = @"The details of the event will go here. In this case it will probably involved drinks and Shadyside";
        detailLabel.font = detailFont;
        detailLabel.textColor = labelColor;
        detailLabel.lineBreakMode = NSLineBreakByWordWrapping;
        detailLabel.numberOfLines = 3;
        detailLabel.backgroundColor = [UIColor clearColor];
        [eventDetailView addSubview:detailLabel];
        
    }
    return self;
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
