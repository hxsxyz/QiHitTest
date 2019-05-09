//
//  AView.m
//  HitTestViewDemo
//
//  Created by Slemon on 15/11/24.
//  Copyright © 2015年 Lemons. All rights reserved.
//

#import "AView.h"
#import "BView.h"
#import "CView.h"


@interface AView ()

@property (nonatomic, strong) BView *bView;
@property (nonatomic, strong) CView *cView;

@end

@implementation AView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setName:@"A"];
        
        _bView = [[BView alloc] init];
        [_bView setBackgroundColor:[UIColor lightGrayColor]];
        [self addSubview:_bView];
        
        _cView = [[CView alloc] init];
        [_cView setBackgroundColor:[UIColor lightGrayColor]];
        [self addSubview:_cView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = 15;
    CGSize size = self.frame.size;
    
    _bView.frame = CGRectMake(margin, margin, size.width - margin * 2, (size.height - margin * 3) / 2);
    _cView.frame = CGRectMake(margin, CGRectGetMaxY(_bView.frame) + margin, size.width - margin * 2, (size.height - margin * 3) / 2);
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    NSLog(@"AView ---->> hitTest:withEvent: ---");
    UIView * view = [super hitTest:point withEvent:event];
    NSLog(@"AView <<--- hitTest:withEvent: --- /n hitTestView:%@", view);
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    
    NSLog(@"AView --->> pointInside:withEvent: ---");
    BOOL isInside = [super pointInside:point withEvent:event];
    NSLog(@"AView <<--- pointInside:withEvent: --- isInside:%d", isInside);
    return isInside;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"AView touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    NSLog(@"AView touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    NSLog(@"AView touchesEnded");
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
//        return nil;
//    }
//    if ([self pointInside:point withEvent:event]) {
//        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
//            CGPoint convertedPoint = [subview convertPoint:point fromView:self];
//            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
//            if (hitTestView) {
//                return hitTestView;
//            }
//        }
//        return self;
//    }
//    return nil;
//}


@end
