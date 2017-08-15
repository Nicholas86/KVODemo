//
//  Student.m
//  TestKVO
//
//  Created by lanouhn on 15/9/7.
//  Copyright (c) 2015年 LiYang. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)dealloc {
    [_name release];
    [super dealloc];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    self.name = context;
    NSLog(@"%@", self.name);
    NSLog(@"change:%@", change);
}
@end
