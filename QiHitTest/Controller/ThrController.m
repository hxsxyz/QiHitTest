//
//  ThrController.m
//  QiHitTest
//
//  Created by wangdacheng on 2019/4/30.
//  Copyright © 2019 dac_1033. All rights reserved.
//

#import "ThrController.h"
#import "BeyondBoundsOfView.h"

@interface ThrController ()

@property (nonatomic, strong) BeyondBoundsOfView *bbView;

@end

@implementation ThrController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"超出父view的bounds";
    [self setupViews];
}

- (void)setupViews {
    
    CGFloat margin = 15;
    CGSize size = self.view.frame.size;
    _bbView = [[BeyondBoundsOfView alloc] initWithFrame:CGRectMake(margin, 150, size.width - margin * 2, 80)];
    [_bbView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:_bbView];
}

@end
