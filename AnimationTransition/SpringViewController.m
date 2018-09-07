//
//  SpringViewController.m
//  AnimationTransition
//
//  Created by 贺超 on 2018/9/7.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import "SpringViewController.h"
#import "SpringShowViewController.h"
#import "SpringTransition.h"
@interface SpringViewController ()

@end

@implementation SpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.modalPresentationStyle = UIModalPresentationCustom;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)show:(UIButton *)sender {
    SpringShowViewController *vc = [[SpringShowViewController alloc] init];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}



- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [SpringTransition transionWithTransitionType:SpringTransitionTypeDismiss];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [SpringTransition transionWithTransitionType:SpringTransitionTypePresent];
    
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
