//
//  SpringTransition.h
//  AnimationTransition
//
//  Created by 贺超 on 2018/9/7.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SpringTransitionType) {
    SpringTransitionTypePresent,
    SpringTransitionTypeDismiss
};

@interface SpringTransition : NSObject <UIViewControllerAnimatedTransitioning>

+ (instancetype)transionWithTransitionType:(SpringTransitionType)type;


@end
