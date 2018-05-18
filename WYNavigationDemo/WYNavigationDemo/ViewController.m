//
//  ViewController.m
//  WYNavigationDemo
//
//  Created by 王俨 on 16/7/9.
//  Copyright © 2016年 wangyan. All rights reserved.
//

#import "ViewController.h"
#import "WYTargetVC.h"
#import "WYOneVC.h"

@interface ViewController () <UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)nextBtnClick {
    UIViewController *targetVC = [WYTargetVC new];
    targetVC.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:targetVC animated:YES];
}

- (IBAction)hasNavBtnClick:(UIButton *)sender {
    [self.navigationController pushViewController:[WYOneVC new] animated:YES];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isHomePage animated:YES];
}

@end
