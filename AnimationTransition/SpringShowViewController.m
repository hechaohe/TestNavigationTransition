//
//  SpringShowViewController.m
//  AnimationTransition
//
//  Created by 贺超 on 2018/9/7.
//  Copyright © 2018年 贺超. All rights reserved.
//

#import "SpringShowViewController.h"

@interface SpringShowViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation SpringShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIButton *btn = [UIButton buttonWithType:0];
//    btn.frame = CGRectMake(self.view.frame.size.width / 2 - 50, 100, 100, 30);
//    btn.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:btn];
//    [btn setTitle:@"dismiss" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)dismissVC {
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self dismissVC];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
















@end
