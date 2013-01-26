//
//  MASettingsViewController.h
//  Mundi
//
//  Created by Mitra Raman on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MASettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIPickerView *defaultCategory;
@property (weak, nonatomic) IBOutlet UILabel *pushNotifications;

@end
