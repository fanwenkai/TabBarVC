//
//  MYTabBarController.m
//  TestVC
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 wenkai. All rights reserved.
//

#import "MYTabBarController.h"
#import "MYTabBar.h"
#import "MYTabBarButton.h"

//定义子控制器的个数
#define VC_COUNT 4

@interface MYTabBarController ()<MYTabBarDelegate>

@end

@implementation MYTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *vcArr = @[@"FirstViewController",@"SecondViewController",@"ThreeViewController",@"FourViewController"];
    NSMutableArray *vc = [[NSMutableArray alloc] init];
    for (int i = 0; i <VC_COUNT; i++)
    {
        //添加子控制器
        UIViewController *VC = [[UIViewController alloc] initWithNibName:vcArr[i] bundle:Nil];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
        [vc addObject:nav];
    }
    self.viewControllers = vc;
    //创建自定义的TabBar
    MYTabBar * myTabBar = [[MYTabBar alloc]initWithFrame:self.tabBar.frame];
    //设置代理
    myTabBar.delegate = self;
    //添加TabBar到View上
    [self.view addSubview:myTabBar];
    
    //根据系统子控制器的个数来创建自定义TabBar上按钮的个数
    NSArray *picSelArr = @[@"TabBar1Sel",@"TabBar2Sel",@"TabBar3Sel",@"TabBar4Sel"];
    NSArray *picArr = @[@"TabBar1",@"TabBar2",@"TabBar3",@"TabBar4"];
    for (int i = 0; i < VC_COUNT; i++)
    {
        //通知自定义按钮TabBar创建按钮,只要调用自定义TabBar的该方法就会创建一个按钮
        [myTabBar addTabBarButtonWithNormalImageName:picArr[i] andDisableImageName:picSelArr[i]];
    }
    //删除系统自带的TabBar,尽量减小内存的使用
    [self.tabBar removeFromSuperview];
}

//实现MYTabBarDelegate代理方法
-(void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

@end
