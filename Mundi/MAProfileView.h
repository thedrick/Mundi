//
//  MAProfileView.h
//  Mundi
//
//  Created by Tyler Hedrick on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAProfileView : UIView

@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) UIButton *addToGroupButton;
@property (nonatomic, strong) UIButton *inviteToEventButton;
@property (nonatomic, strong) UIImageView *profilePicture;
@property (nonatomic, strong) UIButton *settingsButton;
@property (nonatomic, strong) UIButton *myEventsButton;
@property (nonatomic, strong) UIButton *myGroupsButton;

@end
