//
//  MYTabBarButton.m
//  TestVC
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 wenkai. All rights reserved.
//

#import "MYTabBarButton.h"

@implementation MYTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    }
    return self;
}
/**重写这个方法后，按钮就不会自己调用系统内置的复杂的高亮操作*/
-(void)setHighlighted:(BOOL)highlighted
{
    
}

@end
