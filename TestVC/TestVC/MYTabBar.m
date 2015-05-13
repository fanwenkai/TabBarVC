//
//  MYTabBar.m
//  TestVC
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 wenkai. All rights reserved.
//

#import "MYTabBar.h"
#import "MYTabBarButton.h"
//每个TabBarItem的宽度
#define  TAB_BAR_WIDTH 30
@interface MYTabBar ()
// 定义变量记录当前选中的按钮
@property (nonatomic, weak) UIButton *selectBtn;
@end

@implementation MYTabBar

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor = [UIColor blackColor];
    CGFloat colWidth = (self.frame.size.width - self.subviews.count * TAB_BAR_WIDTH) / (self.subviews.count + 1);
    for (int i = 0; i < self.subviews.count; i++)
    {
        UIButton *btn = self.subviews[i];
        //设置Frame
        CGFloat btnY = 0;
        CGFloat btnW = TAB_BAR_WIDTH;
        CGFloat btnH = self.frame.size.height;
        CGFloat btnX = (i + 1) * colWidth + i *btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        //设置按钮的Tag作为将来切换子控制器的索引
        btn.tag = i;
    }
}
- (void)addTabBarButtonWithNormalImageName:(NSString *)norName andDisableImageName:(NSString *)disName
{
    //创建按钮
    MYTabBarButton *btn = [[MYTabBarButton alloc] init];
    //设置按钮上显示的图片
    //设置默认状态图片
    [btn setBackgroundImage:PNG(norName) forState:UIControlStateNormal];
    //设置不可用状态图片
    [btn setBackgroundImage:PNG(disName) forState:UIControlStateDisabled];
    //添加按钮到自定义TabBar
    //为按钮添加监听事件
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn];
    //设置默认选中按钮
    if (1 == self.subviews.count)
    {
        [self btnOnClick:btn];
    }
    //设置按钮高亮状态不调整图片
    btn.adjustsImageWhenHighlighted = NO;
}
//按钮点击事件
-(void)btnOnClick:(UIButton *)btn
{
    // 切换子控制器
    // 通知TabBarController切换控制器
    if ([self.delegate respondsToSelector:@selector(tabBarDidSelectBtnFrom:to:) ]) {
        [self.delegate tabBarDidSelectBtnFrom:self.selectBtn.tag to:btn.tag];
    }
    
    // 0.取消上一次选中的按钮
    self.selectBtn.enabled = YES;
    
    // 1.设置当前被点击按钮为选中状态
    btn.enabled = NO;
    
    // 2.记录当前选中的按钮
    self.selectBtn = btn;

}
@end
