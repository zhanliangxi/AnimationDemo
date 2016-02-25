//
//  CustomHeaderView.h
//  AnimationDemo
//
//  Created by apple on 16/2/24.
//  Copyright © 2016年 LXJenn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomHeaderView;
@protocol CustomHeaderViewDelegate <NSObject>
@optional
- (void)headerView:(CustomHeaderView *)view section:(NSInteger)section;

@end
@interface CustomHeaderView : UITableViewHeaderFooterView

@property (assign, nonatomic) NSInteger section;
@property (weak, nonatomic) id<CustomHeaderViewDelegate> delegate;

@end
