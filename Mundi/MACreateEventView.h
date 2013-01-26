//
//  MACreateEventView.h
//  Mundi
//
//  Created by Tyler Hedrick on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MACreateEventView : UIView
@property (nonatomic, strong) UILabel *addLabel;
@property (nonatomic, strong) UITextField *eventName;
@property (nonatomic, strong) UITextField *date;
@property (nonatomic, strong) UITextField *time;
@property (nonatomic, strong) UITextField *location;
@property (nonatomic, strong) UITextField *category;
@property (nonatomic, strong) UITextView *details;
@end
