//
//  ViewController.m
//  QiHitTest
//
//  Created by wangdacheng on 2019/4/30.
//  Copyright © 2019 dac_1033. All rights reserved.
//

#import "ViewController.h"
#import "FirController.h"
#import "SecController.h"
#import "ThrController.h"

#define Margin      30

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"hitTest方法介绍";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupViews];
}

- (void)setupViews {
    
    CGFloat btnHeight = 50;
    CGSize size = self.view.frame.size;
    NSArray *titles = @[@"hitTest", @"修改按钮热区", @"超出父view的bounds"];
    CGFloat offset = Margin;
    for (int idx=0; idx<titles.count; idx++) {
        NSString *title = [titles objectAtIndex:idx];
        UIButton *button = [self createCustomButton:title];
        button.frame = CGRectMake(Margin, offset, size.width - Margin * 2, btnHeight);
        button.tag = 100 + idx;
        [self.view addSubview:button];
        offset += btnHeight;
    }
}

- (UIButton *)createCustomButton:(NSString *)title {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}


#pragma mark - Actions

- (void)buttonClicked:(UIButton *)button {
    
    if (button.tag == 100) {
        FirController *firCon = [[FirController alloc] init];
        [self.navigationController pushViewController:firCon animated:YES];
    } else if (button.tag == 101) {
        SecController *secCon = [[SecController alloc] init];
        [self.navigationController pushViewController:secCon animated:YES];
    } else if (button.tag == 102) {
        ThrController *thrCon = [[ThrController alloc] init];
        [self.navigationController pushViewController:thrCon animated:YES];
    }
}

@end
