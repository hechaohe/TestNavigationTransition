//
//  ViewController.m
//  TestNavigationTransition
//
//  Created by 贺超 on 2018/9/6.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import "ViewController.h"
#import "AAViewController.h"
#import "Animator.h"

@interface ViewController () <UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) Animator *animator;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    self.animator = [Animator new];
    
    
    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.navigationController.view addGestureRecognizer:panGest];
    
  
}

- (void)pan:(UIPanGestureRecognizer *)sender {
    
    UIView *view = self.view;
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint location = [sender locationInView:view];
        if (location.x < CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1) {
            self.interactionController = [UIPercentDrivenInteractiveTransition new];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [sender translationInView:view];//平移手势在指定坐标系中的平移
        CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds));
        [self.interactionController updateInteractiveTransition:d]; //更新移动的百分比，范围为0.0-1.0之间，如果指定的值小于0.0，则此方法将其更改为0.0，指定大于1.0的值，导致动画显示已完成
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        if ([sender velocityInView:view].x > 0) {  //velocityInView平移手势在指定坐标系中的速度
            [self.interactionController finishInteractiveTransition];
        } else {
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
    
    
}





#pragma mark -- UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPop) {
        return self.animator;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    return self.interactionController;
    
}


#pragma mark -- UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.animator;
}


- (IBAction)presentBtnAction:(UIButton *)sender {
    
    AAViewController *vc = [[AAViewController alloc] init];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}


















@end
