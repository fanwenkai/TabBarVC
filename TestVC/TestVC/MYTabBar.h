//
//  MYTabBar.h
//  TestVC
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 wenkai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MYTabBar;

@protocol MYTabBarDelegate <NSObject>
//当点击按钮标签时执行的代理方法
-(void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger) to;
@end

@interface MYTabBar : UIView
@property(nonatomic ,weak) id<MYTabBarDelegate> delegate;

/**
 *  提供给外界创建按钮
 *
 *  @param norName 默认状态的图片
 *  @param disName 高亮状态的图片
 */
-(void)addTabBarButtonWithNormalImageName:(NSString *)norImageName andDisableImageName:(NSString *)disableImageName;

@end
