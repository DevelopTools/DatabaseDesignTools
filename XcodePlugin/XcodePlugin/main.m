//
//  main.m
//  XcodePlugin
//
//  Created by chenwenhong on 14-5-27.
//  Copyright (c) 2014年 Alipay. All rights reserved.
//

#import "main.h"
#import "PluginMngr.h"

@implementation main

+ (void)pluginDidLoad:(NSBundle *)pluginBundle
{
    @autoreleasepool
    {
        [[PluginMngr shareInstance] attachXcode];
    }
}


@end
