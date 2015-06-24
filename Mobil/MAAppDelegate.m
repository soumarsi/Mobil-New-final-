//
//  MAAppDelegate.m
//  Dr.Margrethu
//
//  Created by Anirban Tah on 19/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import "MAAppDelegate.h"
#import "MALoginViewController.h"
#import "MAHomeViewController.h"
#import "MAHomeViewController.h"
@implementation MAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"] length] != 0)
    {
        NSError *error=nil;
        NSString *urlString1 = [NSString stringWithFormat:@"http://ansa.fo/iosapp/change_language.php?subAdminId=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
        NSLog(@"===%@",urlString1);
        NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
        NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",serverOutput] forKey:@"lang"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"rememberlogin"] isEqualToString:@"login"])
    {
        MAHomeViewController *aft = [[MAHomeViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:aft];
        navigationController.navigationBar.hidden= YES;
        self.window.rootViewController = navigationController;
    }
    else
    {
    MALoginViewController *aft = [[MALoginViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:aft];
    navigationController.navigationBar.hidden= YES;
    self.window.rootViewController = navigationController;
    }
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"] length] != 0)
    {
    NSError *error=nil;
    NSString *urlString1 = [NSString stringWithFormat:@"http://ansa.fo/iosapp/change_language.php?subAdminId=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    NSLog(@"===%@",urlString1);
    NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
    NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];

    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",serverOutput] forKey:@"lang"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"] length] != 0)
    {
        NSError *error=nil;
        NSString *urlString1 = [NSString stringWithFormat:@"http://ansa.fo/iosapp/change_language.php?subAdminId=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
        NSLog(@"===%@",urlString1);
        NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
        NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",serverOutput] forKey:@"lang"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
