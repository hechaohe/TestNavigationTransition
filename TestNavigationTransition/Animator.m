//
//  Animator.m
//  TestNavigationTransition
//
//  Created by 贺超 on 2018/9/6.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import "Animator.h"

@implementation Animator


//实现UIViewControllerAnimatedTransitioning的两个必要方法

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        
        //添加旋转动画
//        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//                                       //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
//                                       animation.fromValue = [NSNumber numberWithFloat:0.f];
//                                       animation.toValue = [NSNumber numberWithFloat: M_PI *2];
//                                       animation.duration = 1;
//                                       animation.autoreverses = NO;
//                                       animation.fillMode = kCAFillModeForwards;
//                                       animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
//                                       [fromViewController.view.layer addAnimation:animation forKey:nil];
        fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toViewController.view.alpha = 1;
        
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
}





@end
