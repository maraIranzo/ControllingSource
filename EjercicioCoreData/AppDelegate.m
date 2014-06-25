//
//  AppDelegate.m
//  EjercicioCoreData
//
//  Created by Mara on 20/06/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataSingleton.h"


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    
    [[CoreDataSingleton sharedInstance] saveContext];
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[CoreDataSingleton sharedInstance] saveContext];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[CoreDataSingleton sharedInstance] saveContext];
}



@end
