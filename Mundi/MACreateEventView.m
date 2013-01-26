//
//  MACreateEventView.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MACreateEventView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MACreateEventView
@synthesize addLabel, eventName, date, time, location, category, details, nextButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        addLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        eventName = [[UITextField alloc] initWithFrame:CGRectMake(10,
                     addLabel.frame.origin.y + addLabel.frame.size.height,
                     300, 40)];
        date = [[UITextField alloc] initWithFrame:CGRectMake(10,
                                                             eventName.frame.origin.y + eventName.frame.size.height + 10,
                                                                  173, 40)];
        time = [[UITextField alloc] initWithFrame:CGRectMake(10 + date.frame.size.width + 6, date.frame.origin.y, 120, 40)];
        location = [[UITextField alloc] initWithFrame:CGRectMake(10, time.frame.origin.y + time.frame.size.height + 10, 300, 40)];
        category = [[UITextField alloc] initWithFrame:CGRectMake(10, location.frame.origin.y + location.frame.size.height + 10, 300, 40)];
        details = [[UITextView alloc] initWithFrame:CGRectMake(10, category.frame.origin.y + category.frame.size.height + 10, 300, 100)];
        nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        nextButton.frame = CGRectMake(270, 410, 60, 60);
        nextButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"buttoncircle.png"]];
        
        [self addSubview:addLabel];
        [self addSubview:eventName];
        [self addSubview:date];
        [self addSubview:time];
        [self addSubview:location];
        [self addSubview:category];
        [self addSubview:details];
        [self addSubview:nextButton];
        [self loadContent];
    }
    
    return self;
}

- (void)loadContent
{
    UIFont *titleFont = [UIFont fontWithName:@"Raleway" size:120];
    UIFont *placeholderFont = [UIFont fontWithName:@"DroidSans" size:18];
    UIFont *detailFont = [UIFont fontWithName:@"DroidSans" size:14];
    UIColor *regularColor = [UIColor colorWithWhite:0.3 alpha:1];
    
    [addLabel setFont:titleFont];
    [addLabel setTextColor:regularColor];
    [addLabel setText:@"add"];
    [addLabel setBackgroundColor:[UIColor clearColor]];
    [addLabel setTextAlignment:NSTextAlignmentCenter];
    [addLabel setTextColor:[UIColor colorWithRed:(136/255.0f) green:(136/255.0f) blue:(136/255.0f) alpha:1]];
    
    [eventName setFont:placeholderFont];
    [date setFont:placeholderFont];
    [time setFont:placeholderFont];
    [location setFont:placeholderFont];
    [category setFont:placeholderFont];
    [details setFont:detailFont];
    
    [eventName setBorderStyle:UITextBorderStyleLine];
    [date setBorderStyle:UITextBorderStyleLine];
    [time setBorderStyle:UITextBorderStyleLine];
    [location setBorderStyle:UITextBorderStyleLine];
    [category setBorderStyle:UITextBorderStyleLine];
    details.layer.borderColor = [[UIColor grayColor] CGColor];
    details.layer.borderWidth = 0.5f;
    details.layer.cornerRadius = 2;
    details.textColor = regularColor;
    
    eventName.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    eventName.layer.borderWidth = 0.5f;
    eventName.layer.cornerRadius = 4;
    eventName.backgroundColor = [UIColor whiteColor];
    
    date.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    date.layer.borderWidth = 0.5f;
    date.layer.cornerRadius = 4;
    date.backgroundColor = [UIColor whiteColor];
    
    time.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    time.layer.borderWidth = 0.7f;
    time.layer.cornerRadius = 4;
    time.backgroundColor = [UIColor whiteColor];
    
    location.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    location.layer.borderWidth = 0.7f;
    location.layer.cornerRadius = 4;
    location.backgroundColor = [UIColor whiteColor];
    
    category.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    category.layer.borderWidth = 0.7f;
    category.layer.cornerRadius = 4;
    category.backgroundColor = [UIColor whiteColor];
    
    nextButton.titleLabel.text = @"Next";

    eventName.placeholder = @"Event name";
    date.placeholder = @"Date";
    time.placeholder = @"Time";
    location.placeholder = @"Location";
    category.placeholder = @"Category";
    details.text = @"Details";
    
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
