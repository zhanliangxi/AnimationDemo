//
//  CustomHeaderView.m
//  AnimationDemo
//
//  Created by apple on 16/2/24.
//  Copyright © 2016年 LXJenn. All rights reserved.
//

#import "CustomHeaderView.h"

@implementation CustomHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
        [control addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:control];
        
    }
    return self;
}

- (void)controlClick{
    
    if ([self.delegate respondsToSelector:@selector(headerView:section:)]) {
        [self.delegate headerView:self section:self.section];
    }
    
}

@end
