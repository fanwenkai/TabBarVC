//
//  NSString+NSString_Custom.h
//  TestVC
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 wenkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Custom)
//清空字符串中的空白字符
- (NSString *)trimString;
//是否空字符串
- (BOOL)isEmptyString;
//返回沙盒中的文件路径
- (NSString *)documentsPath;
//写入系统偏好
- (void)saveToNSDefaultsWithKey:(NSString *)key;
@end
