//
//  MAEventViewController.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/25/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MAEventViewController.h"
#import <Parse/Parse.h>
#import "MAEventCreationViewController.h"

@interface MAEventViewController ()

@end

@implementation MAEventViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Explore"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Events"];
    if (!events) {
        [self loadEvents];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(addEvent:)];
    [[self.tabBarController navigationItem] setRightBarButtonItem:bbi];
}

- (void)loadEvents
{
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    [query addAscendingOrder:@"date"];
    [query setCachePolicy:kPFCachePolicyCacheThenNetwork];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Eror: %@", [error localizedDescription]);
        } else {
            events = objects;
            [self.tableView reloadData];
        }
    }];
}

-(IBAction)addEvent:(id)sender
{
    MAEventCreationViewController *eventCreation = [[MAEventCreationViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:eventCreation];
    [navController setModalPresentationStyle:UIModalPresentationFormSheet];
    
    [self presentViewController:navController animated:YES completion:^{
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *object = [events objectAtIndex:[indexPath row]];
    NSString *eventName = [object objectForKey:@"name"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EventCell"];
    }
    [cell.textLabel setText:eventName];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"TOUCHED THE TABLE");
}

@end
