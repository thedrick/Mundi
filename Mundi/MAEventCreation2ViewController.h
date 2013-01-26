//
//  MAEventCreation2ViewController.h
//  Mundi
//
//  Created by Mitra Raman on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAEventCreation2ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *publicOrPrivate;
- (IBAction)invite:(id)sender;
- (IBAction)inviteView:(id)sender;

@end
