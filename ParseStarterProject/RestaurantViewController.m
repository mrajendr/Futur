//
//  RestaurantViewController.m
//  ParseStarterProject
//
//  Created by Maathusan Rajendram on 9/13/15.
//
//

#import "RestaurantViewController.h"
#import <Parse/Parse.h>

@interface RestaurantViewController ()

@end

@implementation RestaurantViewController

@synthesize showRestaurantData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showRestaurantData:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"restaurant"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            //NSLog(@"QUERY RESULTS: %@", objects);
            NSString *data = [[NSString alloc] init];
            for (PFObject *object in objects) {
                NSLog(@"NAME: %@", [object objectForKey:@"name"]);
                NSLog(@"        ADDRESS: %@", [object objectForKey:@"address"]);
                
                data = [data stringByAppendingString:[NSString stringWithFormat:@"NAME: %@, ADDRESS: %@ \n", [object objectForKey:@"name"], [object objectForKey:@"address"]]];
            }
            showRestaurantData.text = data;
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
