//
//  MAFeedViewCell.h
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MAEventViewCell : UITableViewCell
{
    PFObject *object;
}
@property (nonatomic, strong) UILabel *eventTitle;
@property (nonatomic, strong) UILabel *eventDetails;
@property (nonatomic, strong) UILabel *eventDate;
@property (nonatomic, strong) UILabel *timeLabel;

-(id)initWithEvent:(PFObject *)obj;

@end
