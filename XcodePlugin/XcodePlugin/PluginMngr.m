//
//  PluginMngr.m
//  XcodePlugin
//
//  Created by chenwenhong on 14-5-27.
//  Copyright (c) 2014年 Alipay. All rights reserved.
//

#import "PluginMngr.h"

//menu item title
#define kEditMenuItemTitle                      @"Edit"
#define kRelaunchMenuItemTitle                  @"Relaunch"

//key equivalent
#define kKeyEquivalent_C                        @"C"
#define kKeyEquivalent_R                        @"R"

@implementation PluginMngr

+ (instancetype)shareInstance
{
    static PluginMngr *instance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[PluginMngr alloc] init];
    });
    
    return instance;
}

- (void)dealloc
{
    [self detachXcode];
}

#pragma mark - private

#pragma mark ______doing

- (void)addApplicationWillFinishLaunchingNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillFinishLaunching:)
                                                 name:NSApplicationWillFinishLaunchingNotification
                                               object:nil];
}

- (void)addApplicationDidFinishLaunchingNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidFinishLaunching:)
                                                 name:NSApplicationDidFinishLaunchingNotification
                                               object:nil];
}

- (void)addApplicationWillHideNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillHide:)
                                                 name:NSApplicationWillHideNotification
                                               object:nil];
}

- (void)addApplicationDidHideNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidHide:)
                                                 name:NSApplicationDidHideNotification
                                               object:nil];
}

- (void)addApplicationWillUnhideNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillUnhide:)
                                                 name:NSApplicationWillUnhideNotification
                                               object:nil];
}

- (void)addApplicationDidUnhideNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidUnhide:)
                                                 name:NSApplicationDidUnhideNotification
                                               object:nil];
}

- (void)addApplicationWillBecomeActiveNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillBecomeActive:)
                                                 name:NSApplicationWillBecomeActiveNotification
                                               object:nil];
}

- (void)addApplicationDidBecomeActiveNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive:)
                                                 name:NSApplicationDidBecomeActiveNotification
                                               object:nil];
}

- (void)addApplicationWillResignActiveNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillResignActive:)
                                                 name:NSApplicationWillResignActiveNotification
                                               object:nil];
}

- (void)addApplicationDidResignActiveNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidResignActive:)
                                                 name:NSApplicationDidResignActiveNotification
                                               object:nil];
}

- (void)addApplicationWillUpdateNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillUpdate:)
                                                 name:NSApplicationWillUpdateNotification
                                               object:nil];
}

- (void)addApplicationDidUpdateNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidUpdate:)
                                                 name:NSApplicationDidUpdateNotification
                                               object:nil];
}

- (void)addApplicationWillTerminateNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillTerminate:)
                                                 name:NSApplicationWillTerminateNotification
                                               object:nil];
}

- (void)addApplicationDidChangeScreenParametersNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidChangeScreenParameters:)
                                                 name:NSApplicationDidChangeScreenParametersNotification
                                               object:nil];
}

- (void)addApplicationDidChangeOcclusionStateNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidChangeOcclusionState:)
                                                 name:NSApplicationDidChangeOcclusionStateNotification
                                               object:nil];
}

- (void)addAllNotifications
{
    [self addApplicationWillFinishLaunchingNotification];
    [self addApplicationDidFinishLaunchingNotification];
    [self addApplicationWillHideNotification];
    [self addApplicationDidHideNotification];
    [self addApplicationWillUnhideNotification];
    [self addApplicationDidUnhideNotification];
    [self addApplicationWillBecomeActiveNotification];
    [self addApplicationDidBecomeActiveNotification];
    [self addApplicationWillResignActiveNotification];
    [self addApplicationDidResignActiveNotification];
    [self addApplicationWillUpdateNotification];
    [self addApplicationDidUpdateNotification];
    [self addApplicationWillTerminateNotification];
    [self addApplicationDidChangeScreenParametersNotification];
    [self addApplicationDidChangeOcclusionStateNotification];
}

#pragma mark ______notif

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
    
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    [self addReluanchMenuInEditMenuItem];
    
    NSAlert *alert = [NSAlert alertWithMessageText:@""
                                     defaultButton:@"ok"
                                   alternateButton:@""
                                       otherButton:@""
                         informativeTextWithFormat:@""];
    [alert setMessageText: @"鸿蓉：欢迎您，主人！😍..."];
    [alert setAlertStyle: NSInformationalAlertStyle];
    
    NSTimer *myTimer = [NSTimer timerWithTimeInterval:1.5f
                                               target:self
                                             selector:@selector(hideAlert:)
                                             userInfo:alert
                                              repeats:NO];
    
    [[NSRunLoop currentRunLoop] addTimer:myTimer
                                 forMode:NSModalPanelRunLoopMode];
    
    [alert runModal];
    [myTimer invalidate];
}

- (void)applicationWillHide:(NSNotification *)notification
{
    
}

- (void)applicationDidHide:(NSNotification *)notification
{
    
}

- (void)applicationWillUnhide:(NSNotification *)notification
{
    
}

- (void)applicationDidUnhide:(NSNotification *)notification
{
    
}

- (void)applicationWillBecomeActive:(NSNotification *)notification
{
    
}

- (void)applicationDidBecomeActive:(NSNotification *)notification
{
    
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    
}

- (void)applicationDidResignActive:(NSNotification *)notification
{
    
}

- (void)applicationWillUpdate:(NSNotification *)notification
{
    
}

- (void)applicationDidUpdate:(NSNotification *)notification
{
    
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    
}

- (void)applicationDidChangeScreenParameters:(NSNotification *)notification
{
    
}

- (void)applicationDidChangeOcclusionState:(NSNotification *)notification NS_AVAILABLE_MAC(10_9)
{
    
}

- (void)runRelaunchTask
{
    NSTask *relaunchTask = [[NSTask alloc] init];
    
    NSArray *args = @[@"-c", [@"sleep 2; open " stringByAppendingFormat:@"\"%@\"", [[NSBundle mainBundle] bundlePath]]];
    
    [relaunchTask setLaunchPath:@"/bin/sh"];
    [relaunchTask setArguments:args];
    [relaunchTask launch];
    exit(0);
}

#pragma mark ______action

- (void)relaunchClicked:(id)sender
{
    NSAlert *alert = [NSAlert alertWithMessageText:@""
                                     defaultButton:@"取消"
                                   alternateButton:@""
                                       otherButton:@""
                         informativeTextWithFormat:@""];
    
    [alert setMessageText:@"Xcode重启中...😏"];
    [alert setAlertStyle: NSInformationalAlertStyle];
    
    NSTimer *myTimer = [NSTimer timerWithTimeInterval:1.5f
                                               target:self
                                             selector:@selector(killWindow:)
                                             userInfo:alert
                                              repeats:NO];
    
    [[NSRunLoop currentRunLoop] addTimer:myTimer
                                 forMode:NSModalPanelRunLoopMode];
    
    [alert runModal];
    [myTimer invalidate];
}

- (void)killWindow:(NSTimer *)theTimer
{
    NSAlert *alert = theTimer.userInfo;
    [NSApp endSheet:alert.window];

    [self runRelaunchTask];
}

- (void)hideAlert:(NSTimer *)theTimer
{
    NSAlert *alert = theTimer.userInfo;
    [NSApp endSheet:alert.window];
}

#pragma mark ______add menu

- (void)addReluanchMenuInEditMenuItem
{
    NSMenuItem *editMenuItem = [[NSApp menu] itemWithTitle:kEditMenuItemTitle];
    
    if (editMenuItem)
    {
        NSMenuItem *relaunchMenuItem = [[NSMenuItem alloc] initWithTitle:kRelaunchMenuItemTitle
                                                                  action:@selector(relaunchClicked:)
                                                           keyEquivalent:kKeyEquivalent_R];
        
        [relaunchMenuItem setKeyEquivalentModifierMask:NSAlternateKeyMask];
        [relaunchMenuItem setTarget:self];
        
        [[editMenuItem submenu] addItem:relaunchMenuItem];
    }
}

#pragma mark - public

- (void)attachXcode
{
    [self addAllNotifications];
}

- (void)detachXcode
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
