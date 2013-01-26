//
//  MAAttendeesViewController.m
//  Mundi
//
//  Created by Tyler Hedrick on 1/26/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "MAAttendeesViewController.h"
#import <Parse/Parse.h>
#import "UIImageView+AFNetworking.h"

@interface MAAttendeesViewController ()

@end

@implementation MAAttendeesViewController

- (id)initWithAttendees:(NSArray *)a {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        attendees = nil;
        [self loadAttendees];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    if (!attendees) {
        [self loadAttendees];
    }
}

- (void)loadAttendees
{
    NSDictionary *mitra = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Mitra Raman", @"http://profile.ak.fbcdn.net/hprofile-ak-prn1/50053_548517593_1597495582_q.jpg", nil]
                                                      forKeys:[NSArray arrayWithObjects:@"name", "picture", nil]];
    NSDictionary *tyler = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tyler Hedrick", @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-snc6/195268_728985334_1600258883_q.jpg", nil]
                                                     forKeys:[NSArray arrayWithObjects:@"name", @"picture", nil]];
    attendees = [NSArray arrayWithObjects:mitra, tyler, nil];
}

- (void)setAttendees:(NSArray *)attens
{
    attendees = attens;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [attendees count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AttendeeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[attendees objectAtIndex:[indexPath row]] valueForKey:@"name"];
    NSString *picURL = [[attendees objectAtIndex:[indexPath row]] valueForKey:@"picture"];
    [cell.imageView setImageWithURL:[NSURL URLWithString:picURL]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
