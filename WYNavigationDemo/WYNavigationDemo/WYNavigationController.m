//
//  WYNavigationController.m
//  WYNavigationDemo
//
//  Created by 王俨 on 16/7/9.
//  Copyright © 2016年 wangyan. All rights reserved.
//

#import "WYNavigationController.h"
#import "ViewController.h"
#import "WYTargetVC.h"


@interface WYNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation WYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    id target = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isHideNav = ([viewController isKindOfClass:[ViewController class]] || [viewController isKindOfClass:[WYTargetVC class]]);
    
    NSLog(@"isHide = %d", isHideNav);
    [self setNavigationBarHidden:isHideNav animated:YES];
}

@end
