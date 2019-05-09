//
//  DView.m
//  HitTestViewDemo
//
//  Created by Slemon on 15/11/24.
//  Copyright © 2015年 Lemons. All rights reserved.
//

#import "DView.h"

@implementation DView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setName:@"D"];
    }
    return self;
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    NSLog(@"DView ---->> hitTest:withEvent: ---");
    UIView * view = [super hitTest:point withEvent:event];
    NSLog(@"DView <<--- hitTest:withEvent: --- /n hitTestView:%@", view);
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    
    NSLog(@"DView --->> pointInside:withEvent: ---");
    BOOL isInside = [super pointInside:point withEvent:event];
    NSLog(@"DView <<--- pointInside:withEvent: --- isInside:%d", isInside);
    return isInside;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"DView touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    NSLog(@"DView touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    NSLog(@"DView touchesEnded");
}

@end
