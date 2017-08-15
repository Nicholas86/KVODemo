//
//  FirstViewController.m
//  KVODemo
//
//  Created by lanouhn on 15/9/1.
//  Copyright (c) 2015年 LiYang. All rights reserved.
//

#import "FirstViewController.h"
#import "testView.h"
@interface FirstViewController ()
@property (retain, nonatomic) UILabel *label;
@property (retain, nonatomic) testView *aView;
@end

@implementation FirstViewController
- (void)dealloc {
    [_label release];
    [_aView release];
    //谁添加的通知,谁移除,removeObserve 移除监听者  forkeyPath 被监听对象的属性名
   
    [self.label removeObserver:_aView forKeyPath:@"text"];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    testView *aView = [[testView alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    self.aView = aView;
    aView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:aView];
    
    //KVO 观察某个对象属性发生改变,调用其方法key - value - observe
    UILabel *aLabel = [[[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 40)] autorelease];
    self.label = aLabel;
    aLabel.backgroundColor = [UIColor redColor];
    aLabel.text = @"哈哈";
    [self.view addSubview:aLabel];
    //添加一个观察
    //Observer:让谁去观察这个对象的属性
    //Path:监听该对象的属性名;(一定要写对,复制粘贴)
    //options:
    // NSKeyValueObservingOptionNew:  获取到新值后,(改变之后的)
    // NSKeyValueObservingOptionOld: 获取到旧值
    // NSKeyValueObservingOptionInitial: 初始化时就会调用其方法
    // NSKeyValueObservingOptionPrior: 改变前后各走一次该方法
    //context :传值
    [_aView addObserver:_aView forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew context:_label.text];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 260, 100, 40);
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    //keyPath:监听的那个属性名
    //object:监听的对象
    //change:字典,系统自己生成
    //context:传值
    //NSLog(@"%@", self.label.text);
//    UILabel *tempLabel = (UILabel *)object;
//    tempLabel.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1.0];
    NSLog(@"%@", change);
}
- (void)handleAction:(UIButton *)sender {
    int num = arc4random() % 100;
    self.aView.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1.0];
    self.label.text = [NSString stringWithFormat:@"%d", num];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
