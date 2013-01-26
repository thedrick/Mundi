//
//  MATabNavigation.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MATabNavigation.h"
#import <Parse/Parse.h>
#import "MAEventCreationViewController.h"

@implementation MATabNavigation

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbarbkgd.png"]];
        [[UITabBar appearance] setSelectedImageTintColor:[UIColor clearColor]];
        [[UITabBar appearance] setTintColor:[UIColor clearColor]];
        [[UITabBar appearance] setSelectionIndicatorImage:nil];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    plusButton.frame = CGRectMake(130, 420, 60, 60);
    plusButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"plusButton.png"]];
    [self.view addSubview:plusButton];
    [plusButton addTarget:self
                   action:@selector(selectedPlusButton:)
         forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectedPlusButton:(id)sender
{
    MAEventCreationViewController *eventCreate = [[MAEventCreationViewController alloc] init];
    [self presentViewController:eventCreate animated:YES completion:nil];
}

@end
