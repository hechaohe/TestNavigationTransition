//
//  PresentAnimator.m
//  TestNavigationTransition
//
//  Created by 贺超 on 2018/9/6.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import "PresentAnimator.h"

@implementation PresentAnimator



- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.6;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [transitionContext.containerView insertSubview:toVC.view belowSubview:fromVC.view];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = CGRectMake(0, screenBounds.size.height, screenBounds.size.width, screenBounds.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}






















@end
