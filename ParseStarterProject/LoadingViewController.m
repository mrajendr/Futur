//
//  LoadingViewController.m
//  ParseStarterProject
//
//  Created by Maathusan Rajendram on 9/13/15.
//
//

#import "LoadingViewController.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *filePath = [[NSBundle mainBundle] pathForResource: @"loading" ofType: @"gif"];
    
    NSData *gifData = [NSData dataWithContentsOfFile: filePath];
    [self.webView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    
    [self performSelector:@selector(goToHomeViewController:) withObject:self afterDelay:4];
}

- (void)goToHomeViewController:(id)sender {
    [self performSegueWithIdentifier:@"goToLoading" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
