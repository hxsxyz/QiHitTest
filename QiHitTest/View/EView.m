//
//  EView.m
//  HitTestViewDemo
//
//  Created by Slemon on 15/11/24.
//  Copyright © 2015年 Lemons. All rights reserved.
//

#import "EView.h"

@implementation EView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setName:@"E"];
    }
    return self;
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    NSLog(@"EView ---->> hitTest:withEvent: ---");
    UIView * view = [super hitTest:point withEvent:event];
    NSLog(@"EView <<--- hitTest:withEvent: --- /n hitTestView:%@", view);
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    
    NSLog(@"EView --->> pointInside:withEvent: ---");
    BOOL isInside = [super pointInside:point withEvent:event];
    NSLog(@"EView <<--- pointInside:withEvent: --- isInside:%d", isInside);
    return isInside;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"EView touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    NSLog(@"EView touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    NSLog(@"EView touchesEnded");
}


@end
