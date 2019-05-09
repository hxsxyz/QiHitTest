//
//  BeyondBoundsOfView.m
//  QiHitTest
//
//  Created by wangdacheng on 2019/4/30.
//  Copyright © 2019 dac_1033. All rights reserved.
//

#import "BeyondBoundsOfView.h"

@interface BeyondBoundsOfView ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation BeyondBoundsOfView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button setTitle:@"UIButton" forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor lightGrayColor]];
        _button.frame = CGRectMake(0, 0, 80, 80);
        [self addSubview:_button];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    _button.center = CGPointMake(size.width / 2, 0);
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    
    for (UIView *subview in self.subviews) {
        CGPoint convertedPoint = [subview convertPoint:point fromView:self];
        UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
        if (hitTestView) {
            return hitTestView;
        }
    }
    return nil;
}


@end
