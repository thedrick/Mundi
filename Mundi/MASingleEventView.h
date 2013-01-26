//
//  MASingleEventView.h
//  Mundi
//
//  Created by Tyler Hedrick on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MASingleEventView : UIView
@property (nonatomic, strong) UILabel *eventTitle;
@property (nonatomic, strong) UILabel *creatorLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIView *eventTimeView;
@property (nonatomic, strong) UIView *eventDetailView;
@property (nonatomic, strong) UIView *photoCollectionView;
@property (nonatomic, strong) UIButton *joinButton;
@property (nonatomic, strong) UIButton *attendeesButton;
@end
