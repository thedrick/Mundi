//
//  MyLogInViewController.m
//  Mundi
//
//  Created by Samaan Ghani on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MyLogInViewController.h"

@interface MyLogInViewController ()

@end

@implementation MyLogInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:
                                 [UIImage imageNamed:@"bg.png"]];
    
    
    
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]]];
    [self.logInView.externalLogInLabel setTextColor: [UIColor darkGrayColor ]];
    [self.logInView.signUpLabel setTextColor: [UIColor darkGrayColor ]];
    
    [self.logInView.externalLogInLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:14.0]];
    [self.logInView.signUpLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:14.0]];
    
    // Add login field background
    //fieldsBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    [self.logInView.usernameField setBackgroundColor:[UIColor whiteColor]];
    [self.logInView.usernameField setBackgroundColor:[UIColor whiteColor]];
    self.logInView.usernameField.borderStyle = UITextBorderStyleRoundedRect;
    self.logInView.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.logInView.passwordField setBackgroundColor:[UIColor whiteColor]];
    
    // Set field text color
    [self.logInView.usernameField setTextColor:[UIColor blackColor]];
    [self.logInView.passwordField setTextColor:[UIColor blackColor ]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
