//
//  ViewController.m
//  WYNavigationDemo
//
//  Created by 王俨 on 16/7/9.
//  Copyright © 2016年 wangyan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
}


- (IBAction)nextBtnClick {
    UIViewController *targetVC = [UIViewController new];
    targetVC.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:targetVC animated:YES];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isHomePage animated:YES];
}

@end
