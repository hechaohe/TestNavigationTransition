//
//  AAViewController.m
//  TestNavigationTransition
//
//  Created by 贺超 on 2018/9/6.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import "AAViewController.h"
#import "PresentAnimator.h"
#import "Interactor.h"

@interface AAViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation AAViewController

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
//    [self showHelpCircle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitioningDelegate = self;
    
    
    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGest];
    
}

- (void)pan:(UIPanGestureRecognizer *)sender {
    NSLog(@"...");
    
  
}


- (IBAction)dismiss:(UIButton *)sender forEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)showHelpCircle{
    
    CGPoint center = CGPointMake(self.view.bounds.size.width * 0.5, 100);
    CGSize small = CGSizeMake(30, 30);
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(center.x, center.y, small.width, small.height)];
    circle.layer.cornerRadius = circle.frame.size.width / 2;
    circle.backgroundColor = [UIColor whiteColor];
    circle.layer.shadowOpacity = 0.8;
    circle.layer.shadowOffset = CGSizeZero;
    [self.view addSubview:circle];
    
    [UIView animateWithDuration:0.5 delay:0.25 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        circle.frame = CGRectMake(center.x, center.y, small.width, small.height + 200);
        circle.frame = CGRectMake(center.x, center.y + 200, small.width, small.height);

        circle.layer.opacity = 0;
    } completion:^(BOOL finished) {
        [circle removeFromSuperview];
    }];
    
}





#pragma mark -- UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [PresentAnimator new];
}
















@end
