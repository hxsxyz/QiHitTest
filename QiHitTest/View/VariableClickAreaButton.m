//
//  QiChangeClickEffectiveAreaButton.m
//  QiButton_ChangeEffectiveClickArea
//
//  Created by qishare on 2018/8/11.
//  Copyright © 2018年 qishare. All rights reserved.
//
// 学习地址：https://www.jianshu.com/p/43c22fa3b42c

#import "VariableClickAreaButton.h"

@implementation VariableClickAreaButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    NSLog(@"VariableClickAreaButton ---->> hitTest:withEvent: ---");
    UIView * view = [super hitTest:point withEvent:event];
    NSLog(@"VariableClickAreaButton <<--- hitTest:withEvent: --- /n hitTestView:%@", view);
    return view;
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    NSLog(@"VariableClickAreaButton --->> pointInside:withEvent: ---");
    
    CGRect bounds = self.bounds;
    if (_qi_clickAreaReduceValue > 0) {
        if (_qi_clickAreaReduceValue >= CGRectGetWidth(self.bounds) / 2) {
            _qi_clickAreaReduceValue = CGRectGetWidth(self.bounds) / 2;
        }
        bounds = CGRectInset(self.bounds, _qi_clickAreaReduceValue, _qi_clickAreaReduceValue);
    } else {
        //若热区小于44*44，则放大热区
        CGFloat widthDelta = MAX(44.0 - bounds.size.width, .0);
        CGFloat heightDelta = MAX(44.0 - bounds.size.height, .0);
        bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    }
    BOOL isInside = CGRectContainsPoint(bounds, point);
    NSLog(@"VariableClickAreaButton <<--- pointInside:withEvent: --- isInside:%d", isInside);
    
    return isInside;
}

@end
