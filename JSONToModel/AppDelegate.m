//
//  AppDelegate.m
//  JSONToModel
//
//  Created by runlin on 16/7/19.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()
{
    HomeViewController *_home;
}
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _home = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:[NSBundle bundleForClass:[self class]]];
    
    self.window.title = @"JSON转换成Model";
    [self.window.contentView addSubview:_home.view];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
