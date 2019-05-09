//
//  CView.m
//  HitTestViewDemo
//
//  Created by Slemon on 15/11/24.
//  Copyright © 2015年 Lemons. All rights reserved.
//

#import "CView.h"
#import "DView.h"
#import "EView.h"

@interface CView ()

@property (nonatomic, strong) DView *dView;
@property (nonatomic, strong) EView *eView;

@end

@implementation CView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setName:@"C"];
        
        _dView = [[DView alloc] init];
        [_dView setBackgroundColor:[UIColor lightTextColor]];
        [self addSubview:_dView];
        
        _eView = [[EView alloc] init];
        [_eView setBackgroundColor:[UIColor lightTextColor]];
        [self addSubview:_eView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = 15;
    CGSize size = self.frame.size;
    
    _dView.frame = CGRectMake(margin, margin, size.width - margin * 2, (size.height - margin * 3) / 2);
    _eView.frame = CGRectMake(margin, CGRectGetMaxY(_dView.frame) + margin, size.width - margin * 2, (size.height - margin * 3) / 2);
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    NSLog(@"CView ---->> hitTest:withEvent: ---");
    UIView * view = [super hitTest:point withEvent:event];
    NSLog(@"CView <<--- hitTest:withEvent: --- /n hitTestView:%@", view);
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    
    NSLog(@"CView --->> pointInside:withEvent: ---");
    BOOL isInside = [super pointInside:point withEvent:event];
    NSLog(@"CView <<--- pointInside:withEvent: --- isInside:%d", isInside);
    return isInside;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"CView touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    NSLog(@"CView touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    NSLog(@"CView touchesEnded");
}


@end
