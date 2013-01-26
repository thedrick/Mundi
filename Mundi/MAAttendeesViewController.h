//
//  MAAttendeesViewController.h
//  Mundi
//
//  Created by Tyler Hedrick on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAAttendeesViewController : UITableViewController
{
    NSArray *attendees;
}
- (id)initWithAttendees:(NSArray *)a;
- (void)setAttendees:(NSArray *)attens;
@end
