//
//  MAProfileViewController.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MAProfileViewController.h"
#import "MAProfileView.h"
#import "MAMyEventViewController.h"

@interface MAProfileViewController ()

@end

@implementation MAProfileViewController
@synthesize username, userPicture;

-(UIImage *)imageFromText:(NSString *)text
{
    // set the font type and size
    UIFont *font = [UIFont fontWithName:@"DroidSans" size:20];
    CGSize size  = [text sizeWithFont:font];
    [[UIColor whiteColor] set];
    
    // check if UIGraphicsBeginImageContextWithOptions is available (iOS is 4.0+)
    if (UIGraphicsBeginImageContextWithOptions != NULL)
        UIGraphicsBeginImageContextWithOptions(size,NO,0.0);
    else
        // iOS is < 4.0
        UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 1.0,1.0,1.0,1.0);
    
    // optional: add a shadow, to avoid clipping the shadow you should make the context size bigger
    //
    // CGContextRef ctx = UIGraphicsGetCurrentContext();
    // CGContextSetShadowWithColor(ctx, CGSizeMake(1.0, 1.0), 5.0, [[UIColor grayColor] CGColor]);
    
    // draw in context, you can use also drawInRect:withFont
    [text drawAtPoint:CGPointMake(0.0, 0.0) withFont:font];
    
    // transfer image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle: @"profile"];
        
        [tbi setTitlePositionAdjustment:UIOffsetMake(15.0, -10.0)];
        
        [tbi setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:
          [UIColor whiteColor], UITextAttributeTextColor,
          [UIFont fontWithName:@"DroidSans" size:26.0],
          UITextAttributeFont,
          nil] forState:UIControlStateNormal];
    
    }
    return self;
}

- (void)loadView
{
    MAProfileView *profile = [[MAProfileView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [profile.myEventsButton addTarget:self action:@selector(pressedEvents:)
                     forControlEvents:UIControlEventTouchUpInside];
    [profile.myGroupsButton addTarget:self action:@selector(pressedFriends:) forControlEvents:UIControlEventTouchUpInside];
    self.view = profile;
}

- (IBAction)pressedFriends:(id)sender
{
    PF_FBFriendPickerViewController *friendPicker = [[PF_FBFriendPickerViewController alloc] init];
    friendPicker.allowsMultipleSelection = NO;
    friendPicker.displayOrdering = PF_FBFriendDisplayByFirstName;
    friendPicker.itemPicturesEnabled = YES;
    friendPicker.sortOrdering = PF_FBFriendSortByFirstName;
    
    [friendPicker loadData];
    [friendPicker setDelegate:self];
    
    // MORE OPTIONS
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:friendPicker animated:YES];
}

- (void)facebookViewControllerDoneWasPressed:(id)sender
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)facebookViewControllerCancelWasPressed:(id)sender
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)pressedEvents:(id)sender
{
    MAMyEventViewController *eventView = [[MAMyEventViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(swipeBack:)];
    [swipeRecognizer setDelegate:self];
    [eventView.view addGestureRecognizer:swipeRecognizer];
    [self.navigationController pushViewController:eventView animated:YES];
}

- (void)swipeBack:(UISwipeGestureRecognizer *)gr
{
    if (gr.direction ==  UISwipeGestureRecognizerDirectionRight) {
        if (gr.state == UIGestureRecognizerStateEnded) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)settings:(id)sender {
}

- (IBAction)userEvents:(id)sender {
}

- (IBAction)userFriends:(id)sender {
}
@end
