//
//  SocialViewController.m
//  ParseStarterProject
//
//  Created by Maathusan Rajendram on 9/13/15.
//
//

#import "SocialViewController.h"
#import <Parse/Parse.h>

@interface SocialViewController ()

@end

@implementation SocialViewController

@synthesize socialTextView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // allow users to be able to tap any where on the screen to dissmiss the keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard {
    [socialTextView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSocailData:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"Adult_Income"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            //NSLog(@"QUERY RESULTS: %@", objects);
            NSString *data = [[NSString alloc] init];
            for (PFObject *object in objects) {
                NSLog(@"EDUCATION: %@", [object objectForKey:@"education"]);
                NSLog(@"        INCOME: %@", [object objectForKey:@"income"]);
                
                data = [data stringByAppendingString:[NSString stringWithFormat:@"EDUCATION: %@, INCOME: %@ \n", [object objectForKey:@"education"], [object objectForKey:@"income"]]];
            }
            socialTextView.text = data;
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (IBAction)goToGraph:(id)sender {
    [self performSegueWithIdentifier:@"toIncomeGraph" sender:nil];
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
