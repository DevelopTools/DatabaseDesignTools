//
//  PluginMngr.h
//  XcodePlugin
//
//  Created by chenwenhong on 14-5-27.
//  Copyright (c) 2014年 Alipay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PluginMngr : NSObject

+ (instancetype)shareInstance;
- (void)attachXcode;
- (void)detachXcode;

@end
