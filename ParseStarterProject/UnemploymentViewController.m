//
//  UnemploymentViewController.m
//  ParseStarterProject
//
//  Created by Maathusan Rajendram on 9/12/15.
//
//

#import "UnemploymentViewController.h"
#import <Parse/Parse.h>

@interface UnemploymentViewController ()

@end

@implementation UnemploymentViewController

@synthesize dataView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showData:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"aat2"];
    [query whereKey:@"Year" greaterThan:@2010];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            //NSLog(@"QUERY RESULTS: %@", objects);
            NSString *data = [[NSString alloc] init];
            for (PFObject *object in objects) {
                NSLog(@"YEAR: %@", [object objectForKey:@"Year"]);
                NSLog(@"        Percent UNEMPLOYED: %@", [object objectForKey:@"Unemployed_percent_of_labor_force"]);
                
                data = [data stringByAppendingString:[NSString stringWithFormat:@"YEAR: %@, Percent UNEMPLOYED: %@ \n", [object objectForKey:@"Year"], [object objectForKey:@"Unemployed_percent_of_labor_force"]]];
            }
            dataView.text = data;
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
