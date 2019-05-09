//
//  BaseView.m
//  QiHitTest
//
//  Created by wangdacheng on 2019/4/30.
//  Copyright © 2019 dac_1033. All rights reserved.
//

#import "View.h"

@implementation View

- (void)setName:(NSString *)name {
    
    UILabel *label = [[UILabel alloc] init];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:name];
    [label sizeToFit];
    [self addSubview:label];
}

@end
