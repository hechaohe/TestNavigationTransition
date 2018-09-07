//
//  QQMusicTransitionPush.m
//  AnimationTransition
//
//  Created by 贺超 on 2018/9/7.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import "QQMusicTransitionPush.h"

#import "QQFirstViewController.h"
#import "QQSecondViewController.h"

@implementation QQMusicTransitionPush

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UINavigationController *nav = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    QQFirstViewController *fromVC = (QQFirstViewController *)nav.topViewController;
    QQSecondViewController *toVC = (QQSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //containerView是承载过渡动画中各个view的一个view层
    UIView *hcContainerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    //把firstVC的smallPic进行截图，然后隐藏原图片，这样只对截图进行操作就可以了
    UIView *smallImageSnapShot = [fromVC.smallPic snapshotViewAfterScreenUpdates:YES];
    //截图的初始坐标为小图的位置，由于要把截图加到containerView上，所以需要通过这个方法进行坐标转化，把相对于backgroundView的坐标转化为相对于containerView的坐标
    smallImageSnapShot.frame = [hcContainerView convertRect:fromVC.smallPic.frame fromView:fromVC.backgroundView];
    fromVC.smallPic.hidden = YES;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    //先隐藏toVC，动画完成后再显示出来
    toVC.view.alpha = 0;
    toVC.bigPic.hidden = YES;
    
    [hcContainerView addSubview:toVC.view];
    [hcContainerView addSubview:smallImageSnapShot];
    //根据图层关系把toVC.view和截图先后加到containerView上
    [UIView animateWithDuration:duration animations:^{
        toVC.view.alpha = 1.0f;
        //获取新的frame，即大图的相对于containerView的坐标，并赋值给截图
        CGRect frame = [hcContainerView convertRect:toVC.bigPic.frame fromView:toVC.view];
        smallImageSnapShot.frame = frame;
    } completion:^(BOOL finished) {
        //显示大图
        toVC.bigPic.hidden = NO;
        //小图要显示出来，否则pop会消失
        fromVC.smallPic.hidden = NO;
        //移除截图
        [smallImageSnapShot removeFromSuperview];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
}





















@end
