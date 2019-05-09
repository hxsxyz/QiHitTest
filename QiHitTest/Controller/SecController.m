//
//  SecController.m
//  QiHitTest
//
//  Created by wangdacheng on 2019/4/30.
//  Copyright © 2019 dac_1033. All rights reserved.
//

#import "SecController.h"
#import "VariableClickAreaButton.h"

@interface SecController ()

@property (nonatomic,strong) UILabel *bottomGrayContainerLabel;

@end

@implementation SecController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"修改按钮热区";
    [self setupViews];
}

- (void)setupViews {
    
    UILabel *bottomTipsLabel = [UILabel new];
    bottomTipsLabel.textAlignment = NSTextAlignmentCenter;
    bottomTipsLabel.numberOfLines = 3;
    bottomTipsLabel.text = @"下边灰色视图是一个Label\n 最中间的红色视图是一个按钮B\n 把按钮B的有效点击区域(热区)改为了蓝色区域";
    [self.view addSubview:bottomTipsLabel];
    bottomTipsLabel.frame = CGRectMake(.0, 100.0, CGRectGetWidth(self.view.frame), 70.0);
    bottomTipsLabel.backgroundColor = [UIColor lightGrayColor];
    
    // 增大按钮的点击区域
    _bottomGrayContainerLabel = [UILabel new];
    [self.view addSubview:_bottomGrayContainerLabel];
    _bottomGrayContainerLabel.frame = CGRectMake(CGRectGetMidX(self.view.frame) - 100.0, 200.0, 200.0, 200.0);
    _bottomGrayContainerLabel.backgroundColor = [UIColor darkGrayColor];
    _bottomGrayContainerLabel.userInteractionEnabled = YES;
    
    UILabel *blueRealEffectiveClickAreaLabel = [UILabel new];
    [_bottomGrayContainerLabel addSubview:blueRealEffectiveClickAreaLabel];
    blueRealEffectiveClickAreaLabel.frame = CGRectMake(.0, .0, 44.0, 44.0);
    blueRealEffectiveClickAreaLabel.center = CGPointMake(_bottomGrayContainerLabel.bounds.size.width / 2.0, _bottomGrayContainerLabel.bounds.size.height / 2.0);
    blueRealEffectiveClickAreaLabel.backgroundColor = [UIColor blueColor];
    blueRealEffectiveClickAreaLabel.userInteractionEnabled = YES;
    
    VariableClickAreaButton *redEnlargeClickAreaButton = [VariableClickAreaButton new];
    [_bottomGrayContainerLabel addSubview:redEnlargeClickAreaButton];
    redEnlargeClickAreaButton.frame = CGRectMake(.0, .0, 12.0, 12.0);
    redEnlargeClickAreaButton.center = CGPointMake(_bottomGrayContainerLabel.bounds.size.width / 2.0, _bottomGrayContainerLabel.bounds.size.height / 2.0);
    redEnlargeClickAreaButton.backgroundColor = [UIColor redColor];
    [redEnlargeClickAreaButton addTarget:self action:@selector(changeButtonEffectiveClickAreaButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - Action Functions

- (void)changeButtonEffectiveClickAreaButtonClicked:(UIButton *)button {
    
    button.selected = !button.selected;
    _bottomGrayContainerLabel.backgroundColor = button.selected ? [UIColor purpleColor] : [UIColor darkGrayColor];
}

@end
