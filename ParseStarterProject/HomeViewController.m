//
//  HomeViewController.m
//  ParseStarterProject
//
//  Created by Maathusan Rajendram on 9/12/15.
//
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goBackToMainPage:(id)sender {
//    [self.parentViewController dismissViewControllerAnimated:YES completion:^{
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }];
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)goToCarData:(id)sender {
     [self performSegueWithIdentifier:@"toCarPage" sender:nil];
}

- (IBAction)goToUnemploymentData:(id)sender {
     [self performSegueWithIdentifier:@"toUnemploymentPage" sender:nil];
}

- (IBAction)goToSocialStatus:(id)sender {
    [self performSegueWithIdentifier:@"toSocialStatus" sender:nil];
}

- (IBAction)goToFlightStatus:(id)sender {
    [self performSegueWithIdentifier:@"toFlightStatus" sender:nil];
}
- (IBAction)goToRestaurant:(id)sender {
    [self performSegueWithIdentifier:@"goToRestaurants" sender:nil];
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
