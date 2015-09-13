/**
 * Copyright (c) 2015-present, Parse, LLC.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "ParseStarterProjectViewController.h"

#import <Parse/Parse.h>

@implementation ParseStarterProjectViewController

@synthesize dataSourceArray;
@synthesize cityPickerView;

#pragma mark -
#pragma mark UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource: @"enter" ofType: @"gif"];
    
    NSData *gifData = [NSData dataWithContentsOfFile: filePath];
    [self.webView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
//    var filePath = NSBundle.mainBundle().pathForResource("loading", ofType: "gif")
//    var gif = NSData(contentsOfFile: filePath!)
//    
//    
//    loading.scalesPageToFit = true;
//    
//    loading.loadData(gif, MIMEType: "image/gif", textEncodingName: nil, baseURL: nil)
//    loading.userInteractionEnabled = false;
//    loading.scalesPageToFit = true;
//    
//    
//    let timer = NSTimer.scheduledTimerWithTimeInterval(8.0, target: self, selector: "update", userInfo: nil, repeats: false)

    
    cityPickerView.dataSource = self;
    cityPickerView.delegate = self;
    
    dataSourceArray = @[@"Afghanistan", @"Argentina", @"Australia", @"Belgium", @"Brazil", @"Canada", @"China", @"Dominican Republic", @"France", @"Greece", @"Hong Kong", @"Jordan", @"Luxembourg", @"Mongolia", @"Norway", @"Philippines", @"Russia", @"South Africa", @"Spain", @"Switzerland", @"Taiwan", @"United States of America", @"Zimbabwe"];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)goToHomePage:(id)sender {
    [self performSegueWithIdentifier:@"goToHomePage" sender:nil];
}



#pragma mark - Pickerview data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return dataSourceArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [dataSourceArray objectAtIndex:row];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
