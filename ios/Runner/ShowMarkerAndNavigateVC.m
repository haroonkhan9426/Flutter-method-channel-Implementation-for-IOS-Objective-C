//
//  ShowMarkerAndNavigateVC.m
//  Runner
//
//  Created by APPLE on 04/05/2019.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "ShowMarkerAndNavigateVC.h"

@interface ShowMarkerAndNavigateVC ()

@end

@implementation ShowMarkerAndNavigateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Test Comment 
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
