//
//  FirController.m
//  QiHitTest
//
//  Created by wangdacheng on 2019/4/30.
//  Copyright © 2019 dac_1033. All rights reserved.
//

#import "FirController.h"
#import "AView.h"

@interface FirController ()

@end

@implementation FirController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"hitTest";
    [self setupViews];
}

- (void)setupViews {
    
    CGFloat margin = 30;
    CGSize size = self.view.frame.size;
    
    AView *aView = [[AView alloc] initWithFrame:CGRectMake(margin, margin, size.width - margin * 2, size.height - margin * 2)];
    aView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [aView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:aView];
}


@end
