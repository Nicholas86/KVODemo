//
//  testView.m
//  KVODemo
//
//  Created by lanouhn on 15/9/1.
//  Copyright (c) 2015年 LiYang. All rights reserved.
//

#import "testView.h"

@implementation testView

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    //keyPath:监听的那个属性名
    //object:监听的对象
    //change:字典,系统自己生成
    //context:传值
//    UILabel *tempLabel = (UILabel *)object;
//    tempLabel.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1.0];
    NSLog(@"%@", [NSString stringWithFormat:@"%@", context]);
    //NSLog(@"%@", change);
    NSLog(@"ok");
}

@end
