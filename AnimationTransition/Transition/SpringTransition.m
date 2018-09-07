//
//  SpringTransition.m
//  AnimationTransition
//
//  Created by 贺超 on 2018/9/7.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import "SpringTransition.h"

@interface SpringTransition()

{
    SpringTransitionType _type;
}

@end

@implementation SpringTransition


+ (instancetype)transionWithTransitionType:(SpringTransitionType)type {
    return [[self alloc] initWithTransitionType:type];
}

- (instancetype)initWithTransitionType:(SpringTransitionType)type {
    
    if (self = [super init]) {
        _type = type;
    }
    return self;
    
}









- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    switch (_type) {
        case SpringTransitionTypePresent:
            [self presentAnimation:transitionContext];
            break;
        case SpringTransitionTypeDismiss:
            [self dismissAnimation:transitionContext];
            break;
            
        default:
            break;
    }
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return _type == SpringTransitionTypePresent ? 0.8 : 0.4;
}


- (void)presentAnimation:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *hcContainerView = [transitionContext containerView];
    
    UIView *snapView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    snapView.frame = fromVC.view.frame;
    fromVC.view.hidden = YES;
    [hcContainerView addSubview:snapView];
    
    [hcContainerView addSubview:toVC.view];
    
    toVC.view.frame = CGRectMake(0, hcContainerView.bounds.size.height, hcContainerView.bounds.size.width, 400);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        
        toVC.view.transform = CGAffineTransformMakeTranslation(0, -400);
        snapView.transform = CGAffineTransformMakeScale(0.88, 0.88);
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}


- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *hcContainerView = [transitionContext containerView];
    UIView *snapView = [hcContainerView.subviews objectAtIndex:0];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromVC.view.transform = CGAffineTransformIdentity;
        snapView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        toVC.view.hidden = NO;
        [snapView removeFromSuperview];
    }];
    
}























@end
