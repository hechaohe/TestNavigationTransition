//
//  QQMusicTransitionDismiss.m
//  AnimationTransition
//
//  Created by 贺超 on 2018/9/7.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import "QQMusicTransitionDismiss.h"
#import "QQFirstViewController.h"
#import "QQSecondViewController.h"
@implementation QQMusicTransitionDismiss









- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    
    UINavigationController *nav = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    QQFirstViewController *toVC = (QQFirstViewController *)[nav topViewController];
    QQSecondViewController *fromVC = (QQSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *hcContainerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UIView *bigImageSnapShot = [fromVC.bigPic snapshotViewAfterScreenUpdates:YES];
    bigImageSnapShot.frame = [hcContainerView convertRect:fromVC.bigPic.frame fromView:fromVC.view];
    
    fromVC.bigPic.hidden = YES;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toVC.smallPic.hidden = YES;
    
    [hcContainerView addSubview:nav.view];
    [hcContainerView addSubview:bigImageSnapShot];
    
    
    [UIView animateWithDuration:duration animations:^{
        toVC.view.alpha = 1;
        CGRect frame = [hcContainerView convertRect:toVC.smallPic.frame fromView:toVC.backgroundView];
        bigImageSnapShot.frame = frame;
    } completion:^(BOOL finished) {
        toVC.smallPic.hidden = NO;
        fromVC.bigPic.hidden = NO;
        [bigImageSnapShot removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
    
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}














@end
