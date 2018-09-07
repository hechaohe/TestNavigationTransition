//
//  QQFirstViewController.m
//  AnimationTransition
//
//  Created by 贺超 on 2018/9/7.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import "QQFirstViewController.h"
#import "QQSecondViewController.h"
#import "QQMusicTransitionPush.h"  //present
#import "QQMusicTransitionDismiss.h" //dismiss


@interface QQFirstViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation QQFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}













- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[QQMusicTransitionDismiss alloc] init];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[QQMusicTransitionPush alloc] init];
}







- (IBAction)pushToSecond:(id)sender {
    QQSecondViewController *vc = [[QQSecondViewController alloc] init];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
    
}


@end
