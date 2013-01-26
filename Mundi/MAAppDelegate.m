//
//  MAAppDelegate.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MAAppDelegate.h"
#import <Parse/Parse.h>
#import "MATabNavigation.h"
#import "MAProfileViewController.h"
#import "MAEventViewController.h"
#import "MAMainNavController.h"

@implementation MAAppDelegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [imageData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    headerImageView.image = [UIImage imageWithData:imageData];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [PFFacebookUtils handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation { return [PFFacebookUtils handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [Parse setApplicationId:@"294970237291608"
                  clientKey:@"e6225746e6bdbf2d42ad572b2cbc57db"];
    [PFFacebookUtils initializeWithApplicationId:@"294970237291608"];
        
    MAEventViewController *eventViewController = [[MAEventViewController alloc] initWithStyle:UITableViewStylePlain];
    MAProfileViewController *profieViewController = [[MAProfileViewController alloc] init];
    
    MATabNavigation *tabController = [[MATabNavigation alloc] init];
    [tabController setViewControllers:[NSArray arrayWithObjects:eventViewController, profieViewController, nil]];
    MAMainNavController *navController = [[MAMainNavController alloc] initWithRootViewController:tabController];
    self.window.rootViewController = navController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    if (![PFUser currentUser]) { // No user logged in
        // Create the log in view controller
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        [logInViewController setDelegate:navController]; // Set ourselves as the delegate
        
        // Create the sign up view controller
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
        [signUpViewController setDelegate:navController]; // Set ourselves as the delegate
        
        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];
        
        // Present the log in view controller
        [navController presentViewController:logInViewController animated:YES completion:NULL];
    }
    
    
    
    return YES;
}


- (IBAction)loginButtonTouchHandler:(id)sender {
    NSArray *permissionsArray = @[@"user_location", @"gender", @"name", @"first_name", @"read_friendslist"];
    
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        
        if(!user) {
            if(!error) {
                NSLog(@"User cancelled FB login");
            } else{
                NSLog(@"error occurred: %@", error);
            }
        } else if(user.isNew) {
            NSLog(@"User with FB signed up and logged in");
            [self.navigationController pushViewController:[[UserDetailsViewController alloc]initWithStyle: UITableViewStyleGrouped] animated:YES];
        } else {
            NSLog(@"User with FB logged in");
            [self.navigationController pushViewController:[[UserDetailsViewController alloc]initWithStyle:UITableViewStyleGrouped] animated:YES];
        }
    }];
}

- (void)viewDidLoad {
    
    NSString *requestPath = @"me/?fields=name,location,gender,first_name,friendslist";
    
    PF_FBRequest *request = [PF_FBRequest requestForGraphPath:requestPath];
    [request startWithCompletionHandler:^(PF_FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            NSDictionary *userData = (NSDictionary *)result;
            
            NSString *facebookID = userData[@"id"];
            NSString *name = userData[@"name"];
            NSString *location = userData[@"location"][@"name"];
            NSString *gender = userData[@"gender"];
        }
    }];
    
    _imageData = [[NSMutableData alloc]init];
    
    NSUrl *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:pictureURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:2.0f];
    NSURLConnection *urlConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
    
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        [self.navigationController pushViewController: [[UserDetailsViewController alloc]initWithStyle:UITableViewStyleGrouped]animated:NO];
    }
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
