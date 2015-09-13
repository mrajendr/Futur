//
//  FlightViewController.m
//  ParseStarterProject
//
//  Created by Maathusan Rajendram on 9/13/15.
//
//

#import "FlightViewController.h"
#import <Parse/Parse.h>

@interface FlightViewController ()

@end

@implementation FlightViewController

@synthesize flightStatusView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showFlightData:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"Flight"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            //NSLog(@"QUERY RESULTS: %@", objects);
            NSString *data = [[NSString alloc] init];
            for (PFObject *object in objects) {
                NSLog(@"DELAYED: %@", [object objectForKey:@"ArrDel15"]);
                NSLog(@"        VISIBILITY: %@", [object objectForKey:@"Visibility"]);
                
                data = [data stringByAppendingString:[NSString stringWithFormat:@"DELAYED: %@, WEATHER TYPE: %@ \n", [object objectForKey:@"ArrDel15"], [object objectForKey:@"WeatherType"]]];
            }
            flightStatusView.text = data;
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
