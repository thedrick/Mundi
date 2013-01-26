//
//  MAGroupViewController.h
//  Mundi
//
//  Created by Mitra Raman on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAGroupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *groupImage;
@property (weak, nonatomic) IBOutlet UILabel *groupName;
@property (weak, nonatomic) IBOutlet UILabel *groupCreator;
- (IBAction)addFriends:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *groupDetails;
- (IBAction)leaveGroup:(id)sender;

@end
