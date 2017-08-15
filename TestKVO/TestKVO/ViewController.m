//
//  ViewController.m
//  TestKVO
//
//  Created by lanouhn on 15/9/7.
//  Copyright (c) 2015年 LiYang. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
@interface ViewController ()
@property (retain, nonatomic) UILabel *aLabel;
@property (retain, nonatomic) UIButton *btn;
@property (retain, nonatomic) Student *aStudent;
@end

@implementation ViewController
- (void)dealloc {
    [_aStudent release];
    [_aLabel release];
    [_btn release];
    //[_aLabel removeObserver:self forKeyPath:@"text"];
    [_aLabel removeObserver:_aStudent forKeyPath:@"text"];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建对象
    UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    self.aLabel = aLabel;
    aLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:aLabel];
    [aLabel release];
    //添加观察者
    //谁要被观察,谁就add添加一个观察者
    //observe:观察者,你要让谁去观察 就写谁
    //keyPath:要被观察的属性(复制粘贴保证写对)
    //options:NSKeyValueObservingOptionNew:属性有变化调用该方法,获取到属性新值
    //        NSKeyValueObservingOptionOld:属性有变化调用该方法,获取到属性旧值
    //        NSKeyValueObservingOptionInitial:初始化时,添加观察者的时候,以后属性有变化时仍然会调用
    //        NSKeyValueObservingOptionPrior:获取新旧值会各走一次
    //可以附加&&
    //context:传值
    /*
    [_aLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
     */
    //添加另外一个观察者
    Student *aStudent = [[[Student alloc] init] autorelease];
    self.aStudent = aStudent;
    [_aLabel addObserver:aStudent forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:@"28班最帅"];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 300, 100, 50);
    self.btn = btn;
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn  setTitle:@"点击" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleLabel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    

}
- (void)handleLabel:(UIButton *)btn {
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(handle:) userInfo:nil repeats:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)handle:(NSTimer *)timer {
    _aLabel.text = [NSString stringWithFormat:@"%d", arc4random() % 10];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"changechange:%@", change);
    //object:被观察的对象
    //change:系统自动生成的一个字典.
    /*
    kind对应的值:
    NSKeyValueChangeSetting = 1,表示刚才的动作是一个赋值的动作
    NSKeyValueChangeInsertion = 2,表示刚才的动作是一个插入一个新的数据的动作
    NSKeyValueChangeRemoval = 3,表示刚才的动作是一个删除的动作
    NSKeyValueChangeReplacement = 4,表示刚才的动作是一个替换的动作
    */
}

@end
