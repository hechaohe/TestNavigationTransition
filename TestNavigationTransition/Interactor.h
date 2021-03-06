//
//  Interactor.h
//  TestNavigationTransition
//
//  Created by 贺超 on 2018/9/6.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Interactor : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL hasStarted;
@property (nonatomic, assign) BOOL shouldFinish;

@end
