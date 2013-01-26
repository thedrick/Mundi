//
//  MAProfileViewController.h
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UIImageView *userPicture;

- (IBAction)settings:(id)sender;
- (IBAction)userEvents:(id)sender;
- (IBAction)userGroups:(id)sender;

@end
