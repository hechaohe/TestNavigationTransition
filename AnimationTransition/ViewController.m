//
//  ViewController.m
//  AnimationTransition
//
//  Created by 贺超 on 2018/9/7.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import "ViewController.h"
#import "QQFirstViewController.h"
#import "SpringViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)qqAction:(UIButton *)sender {
    QQFirstViewController *vc = [[QQFirstViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)tanhuangAction:(UIButton *)sender {
    SpringViewController *vc = [[SpringViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
















@end
