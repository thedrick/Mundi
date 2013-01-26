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
#import "MASingleEventViewController.h"
#import "MAEventViewCell.h"

@interface MAEventViewController ()

@end

@implementation MAEventViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
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
            NSLog(@"Error: %@", [error localizedDescription]);
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
    return 90;
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section != 0) {
        return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 320, 90)];
    [titleView setBackgroundColor:[UIColor clearColor]];
    UILabel *headerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    [headerTitleLabel setBackgroundColor:[UIColor clearColor]];
    [headerTitleLabel setTextColor:[UIColor colorWithRed:136 green:136 blue:136 alpha:1]];
    [headerTitleLabel setText:@"feed"];
    [headerTitleLabel setTextAlignment:NSTextAlignmentCenter];
    UIFont *titleFont = [UIFont fontWithName:@"Raleway" size:120];
    [headerTitleLabel setFont:titleFont];
    [titleView addSubview:headerTitleLabel];
    return titleView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [events count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *object = [events objectAtIndex:[indexPath section]];
    
    MAEventViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell"];
    if (!cell) {
        cell = [[MAEventViewCell alloc] init];
    }
    [cell setObject:object];
    
    return cell;
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return 80;
    return 1.0;
}


-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 5.0;
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *object = [events objectAtIndex:[indexPath row]];
    MASingleEventViewController *singleEvent = [[MASingleEventViewController alloc] initWithObject:object];
    [self.navigationController pushViewController:singleEvent animated:YES];
}

@end
